<?php
/**
* @version			Add Keywords 0.8RC3
* @author			Matthew Faulds
* @copyright		Copyright (C) 2009 Trafalgar Design (IOM) Ltd - All Rights Reserved.
* @license			GNU/GPL, see LICENSE.php
* @acknowledgements James Frank
* 
* Still todo:
*
* Method for properly preserving custom metadata - flat file (?txt, ?xml) versus db - possibly a versioning system....???!!!
*
*/

defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.plugin.plugin' ); 

class plgSystemAddKeywords extends JPlugin
{
	private $addkeyParams;
	private $akProcessDesc;
	private $akProcessKeys;
	
	public function plgSystemAddKeywords( &$subject, $config )
	{
		parent::__construct( $subject, $config ); 									//Call the parent constructor
		$this->_plugin = &JPluginHelper::getPlugin( 'system', 'addkeywords' ); 		//Get a reference to this plugin
		$this->params = new JParameter( $this->_plugin->params ); 					//Get the plugin parameters
		$this->addkeyParams = plgSystemAddKeywords::allParams($this->params);
	}
	
	/* FRONTEND FUNCTIONS */
	
	// keyword tag list +/- related items module loading
	public function onPrepareContent( &$article, &$params, $limitstart=0 )
	{
		$app = &JFactory::getApplication();
		$doc = &JFactory::getDocument();
		$user = &JFactory::getUser();

		if( $app->isAdmin() ) {
			return true;
		}
		
        $docType = $doc->getType();        
       	if ($docType != 'html') {
       		return true;
       	}

		if(isset($article) AND (!isset($article->id) OR is_null($article->id))) {
			return true;
		}
		
		if(!$this->addkeyParams->tags AND !$this->addkeyParams->relatedItems) {
			return true;
		}
		
		$view = JRequest::getWord('view');
		$layout = JRequest::getWord('layout');
		$Itemid = JRequest::getInt('Itemid');

		if(($view == 'frontpage' OR $view == 'newsportal') AND !$this->addkeyParams->frontTag){
			return true;
		}
		if($layout == 'blog' AND !$this->addkeyParams->blogTag){
			return true;
		}
		if(($layout != 'blog') AND ($view == 'category' OR $view == 'section')){
			return true;
		}

		//exclude certain sections/categories/menus and/or articles
		if(isset($this->addkeyParams->frontMenuid)) {
			if(plgSystemAddKeywords::exclude($Itemid,$this->addkeyParams->frontMenuid)) {
				return true;
			}
		}
		if(isset($this->addkeyParams->frontSecid) AND isset($article->sectionid)) {
			if(plgSystemAddKeywords::exclude($article->sectionid,$this->addkeyParams->frontSecid)) {
				return true;
			}
		}
		if(isset($this->addkeyParams->frontCatid) AND isset($article->catid)) {
			if(plgSystemAddKeywords::exclude($article->catid,$this->addkeyParams->frontCatid)) {
				return true;
			}
		}
		
		//looks like we're finally doing it...
		$html = '';
		
		if($this->addkeyParams->tags) {
			
			$tagEdit = 0;
			$tagButton = '';
						
    		//Ajax stuff for front-end editing
			if($this->addkeyParams->addTag AND $user->id AND ($user->gid >= $this->addkeyParams->addTagUsers) AND $view != 'frontpage' AND $layout != 'blog') {
				$script = "
				window.addEvent( 'domready', function() {
					$('ak_addForm').addEvent('submit', function(e) {
						new Event(e).stop();
						$('ak_addFormDiv').setStyle('display', 'none');
						$('ak_addButton').setStyle('display', '');
						var tagproc = $('ak_tagDiv').empty().addClass('ajax-loading').setStyle('display', 'block');
						this.send({
							update: tagproc,
							onComplete: function() {
								tagproc.removeClass('ajax-loading');
							}
						});
					});
					$('ak_addButton').addEvent('submit', function(e) {
						new Event(e).stop();
						$('ak_addButton').setStyle('display', 'none');
						$('ak_tagDiv').setStyle('display', 'none');
						var myClone = $('ak_addForm').clone().cloneEvents($('ak_addForm'));
						var formproc = $('ak_addFormDiv').addClass('ajax-loading').setStyle('display', 'block');
						this.send({
							update: formproc,
							onComplete: function() {
								formproc.removeClass('ajax-loading');
								$$('#ak_addForm').each(function(el) {
									el.cloneEvents(myClone);
								});
							}
						});
					});
				});";
				
				$doc->addScriptDeclaration( $script );
				
				$tagButton = 	'<form id="ak_addButton" method="post" action="'.JURI::base().'index.php">'.
								'<input type="image" style="float:right;" src="images/M_images/edit.png" alt="Edit Tags" />'.
								'<input type="hidden" name="ak_id" value="'.$article->id.'" />'.
								'<input type="hidden" name="ak_tagEdit" value="1" />'.
								'<input type="hidden" name="check" value="post" />'.
								'<input type="hidden" name="option" value="com_akseo" />'.
								'<input type="hidden" name="controller" value="akseo" />'.
								'<input type="hidden" name="task" value="editTags" />'.
								JHTML::_( 'form.token' ).'</form>';
				$tagEdit = 1;
			}
		
			$akstyle = 	'ul#ak_tagList { '.$this->addkeyParams->ulStyle.' }';
			$akstyle .= 'ul#ak_tagList li { '.$this->addkeyParams->liStyle.' }';
			$doc->addStyleDeclaration($akstyle);
						
			$html = '<br /><div id="ak_tags">';
			
				if($this->addkeyParams->tagFieldset) {
					$html .= '<fieldset><legend>'.$this->addkeyParams->tagTitle.'</legend>';
				}
			
			$html .= $tagButton;
			
			$tags = plgSystemAddKeywords::tagList($article,$this->addkeyParams,0,$ajax=0);
			$tagEdit ? $tagForm = plgSystemAddKeywords::tagList($article,$this->addkeyParams,1,$ajax=0) : $tagForm = '';
				
			$html .= '<div id="ak_tagDiv">'.$tags.'</div><div id="ak_addFormDiv" style="display:none;">'.$tagForm.'</div>';
			
				if($this->addkeyParams->tagFieldset) {
					$html .= '</fieldset>';
				}
		
			$html .= '</div>';
		}
		
		//add a related items module
		if($this->addkeyParams->relatedItems) {
			$module = plgSystemAddKeywords::_load($this->addkeyParams->modName,$this->addkeyParams->modStyle);
			
			$html .= '<br /><div id="ak_related">';
			if($this->addkeyParams->modFieldset) {
				$html .= '<fieldset><legend>'.$this->addkeyParams->modTitle.'</legend>';
			}
			$html .= $module;
			if($this->addkeyParams->modFieldset) {
				$html .= '</fieldset>';
			}
			$html .= '</div>';
		}
		
		$article->text .= $html;
		
		return true;
	}
	
	public function tagList($article,$addkeyParams,$tagEdit,$ajax)
	{
		if(!$addkeyParams) {
			$plugin = &JPluginHelper::getPlugin('system', 'addkeywords');
			$params = new JParameter( $plugin->params );
			$addkeyParams = plgSystemAddKeywords::allParams($params);
		}
				
		switch($tagEdit)
		{
			case 0:
			
				$searchmenuid = plgSystemAddKeywords::getItemid();
				
				$keys = explode(',',$article->metakey);
				$links = '';
				$i = 0;
				foreach($keys as $key) {
					if($i < $addkeyParams->numTags) {
						$links .= '<li><a href="'.JRoute::_("index.php?option=com_search&searchword=$key&searchphrase=$addkeyParams->searchType&Itemid=$searchmenuid").'" title="'.$key.'" rel="nofollow" >'.$key.'</a></li> ';
						$i++;
					}
				}			
				
				$html = '<ul id="ak_tagList">'.$links.'</ul>';
				break;
			
			case 1:
								
				$keys = explode(',',$article->metakey);
				$links = '';
				$i = 0;
				foreach($keys as $key) {
					// trailing space for each li is essential for wrapping
					$links .= '<li><label for="tag_'.$i.'"><input type="checkbox" id="tag_'.$i.'" name="ak_tags[]" value="'.$key.'" />&nbsp;'.$key.'</label></li> ';
					$i++;
				}			
				
				$html = 	'<form id="ak_addForm" method="post" action="'.JURI::base().'index.php">'.
							'<div><b>'.JText::_('Select tags/keywords to delete').'</b></div><br />'.
							'<ul id="ak_tagList">'.$links.'</ul><br />';
				
				$html .= 	'<label for="newTag"><b>'.JText::_('New keywords (comma separated)').'</b></label>'.
							'<br /><br />'.
							'<textarea cols="70" rows="5" id="newTag" name="ak_newTag" /></textarea>'.
							'<div>'.JText::_('New Keyword Position').':&nbsp;&nbsp;<label for="before">'.JText::_('Before').'</label><input id="before" name="ak_position" type="radio" value="1" checked /><label for="after">'.JText::_('After').'</label><input id="after" name="ak_position" type="radio" value="0" /></div>'.
							'<br /><br />'.
							'<label for="description"><b>'.JText::_('Article description').'</b></label>'.
							'<br /><br />'.
							'<textarea cols="70" rows="5" id="description" name="ak_description">'.$article->metadesc.'</textarea>'.
							'<br /><br />'.
							'<div><b>'.JText::_('Other Options').'</b>'.
							'<br /><br />'.JText::_('Regenerate Article Metadata').':&nbsp;&nbsp;<label for="yes">'.JText::_('Yes').'</label><input id="yes" name="ak_regenerate" type="radio" value="1" /><label for="no">'.JText::_('No').'</label><input id="no" name="ak_regenerate" type="radio" value="0" checked /></div>'.
							'<br /><br />'.
							'<input type="submit" name="submit" value="'.JText::_('Submit Edited Metadata').'" />'.
							'<input type="hidden" name="ak_id" value="'.$article->id.'" />'.
							// set return value to the taglist by changing tagEdit to 0
							'<input type="hidden" name="ak_tagEdit" value="0" />'.
							'<input type="hidden" name="check" value="post" />'.
							'<input type="hidden" name="option" value="com_akseo" />'.
							'<input type="hidden" name="task" value="editTags" />'.
							JHTML::_( 'form.token' ).'</form>';
				break;
				
		}

		if($ajax) {
			//print_r($article);
			//print_r($_POST);
			echo $html;
			jexit();
		} else {
			return $html;
		}
	}
	
	private function _load( $position, $style="xhtml")
    {	
        $document = &JFactory::getDocument();
        $renderer = $document->loadRenderer('module');
        $params = array('style'=>$style);

        $contents = '';
        
        if(!class_exists('JModuleHelper')) {
			jimport('joomla.application.module.helper');
        }

        foreach (JModuleHelper::getModules($position) as $mod) {
                $contents .= $renderer->render($mod, $params);
        }
        return $contents;
    }
    
    private function getItemid( $component='com_search')
    {
    	$db = &JFactory::getDBO();

        $query = "SELECT id FROM #__menu"
                ."\n WHERE link LIKE '%option=$component%'"
                ."\n AND type = 'component'"
                ."\n AND published = 1";
        $db->setQuery($query, 0, 1);

        return $db->loadResult();
    }
    
    private function getAKid()
    {
    	$db = &JFactory::getDBO();

        $query = "SELECT id FROM #__plugins"
                ."\n WHERE element LIKE '%addkeywords%'";
        $db->setQuery($query);

        return $db->loadResult();
    }
    
    private function exclude($var,$param)
    {
		if(is_array($param) AND in_array($var,$param)) {
			return true;
		} elseif($var == $param) {
			return true;
		} else {
			return false;
		}
    }
	
	/* ADMIN FUNCTIONS */

	// menu meta functions
	public function onAfterDispatch()
	{
		$app = &JFactory::getApplication();
		$doc = &JFactory::getDocument();
		
		if( $app->isAdmin() ) {
	
			if($this->addkeyParams->menumeta) {
				if(JRequest::getString('option') == 'com_menus' AND JRequest::getString('task') == 'edit') {
					
				//	print_r($doc->_buffer['component']);
					
					$_lang = & JFactory::getLanguage();
					// load plugin language file
					$_lang->load( 'plg_system_addkeywords', JPATH_ADMINISTRATOR );
			
					$_params = $this->getXMLParams();
					$render = $_params->render();
				//	print_r($render);
					
					jimport('joomla.html.pane');
					$_slider = &JPane::getInstance( 'sliders', array( 'allowAllClose' => true ) );
					
					$_pane = $_slider->startPanel( JText :: _( 'Parameters (Metadata)' ), "metadata-page" );
					$_pane .= $_params->render();
					$_pane .= $_slider->endPanel();
					
					$_s = '(<div[^>]*id="menu-pane"[^>]*?>[\s\S]*)(</div>[^<]*?</td>[^<]*?</tr>[^<]*?</table>[^<]*?<input type="hidden")';
					$_r = '\1'.$_pane.'\2';
						
					foreach( $doc->_buffer['component'] as &$_buffer ) {
						$_buffer = preg_replace( '#'.$_s.'#si', $_r, $_buffer );
					}
				}
			}
			if(JRequest::getString('option') == 'com_plugins' AND JRequest::getString('task') == 'edit' AND $this->addkeyParams->newparams) {
				/*$AKid = plgSystemAddKeywords::getAKid();
				$cid 	= JRequest::getVar( 'cid', array(0), '', 'array' );
				JArrayHelper::toInteger($cid, array(0));
			    if($cid[0] == $AKid) {
					
					//print_r($doc);

					$_lang = & JFactory::getLanguage();
					// load plugin language file
					$_lang->load( 'plg_system_addkeywords', JPATH_ADMINISTRATOR );
			
					$lists 	= array();
					$row 	=& JTable::getInstance('plugin');
					// get params definitions
					// load the row from the db table
					$row->load( $cid[0] );
					$_params = new JParameter( $row->params, JApplicationHelper::getPath( 'plg_xml', $row->folder.DS.$row->element ), 'plugin' );
					//print_r($_params);
					
					jimport('joomla.html.pane');
					$_pane = &JPane::getInstance( 'sliders', array( 'allowAllClose' => true ) );
					$_sliders = $_pane->startPane('plugin-pane');
					
					$title = JText::_( 'Parameters - Keyword Generation' );
					$_sliders .= $_pane->startPanel( $title, "params-page" );
					$_sliders .= $_params->render('params', 'keywords');
					$_sliders .= $_pane->endPanel();
					
					$title = JText::_( 'Parameters - Description Generation' );
					$_sliders .= $_pane->startPanel( $title, "params-page" );
					$_sliders .= $_params->render('params', 'description');
					$_sliders .= $_pane->endPanel();
					
					$title = JText::_( 'Parameters - Tags and Related Items' );
					$_sliders .= $_pane->startPanel( $title, "detail-page" );
					$_sliders .= $_params->render('params', 'tagsandrel');
					$_sliders .= $_pane->endPanel();
					
					$title = JText::_( 'Parameters - Page Title' );
					$_sliders .= $_pane->startPanel( $title, "detail-page" );
					$_sliders .= $_params->render('params', 'pagetitle');
					$_sliders .= $_pane->endPanel();
					
					$title = JText::_( 'Parameters - Advanced Options' );
					$_sliders .= $_pane->startPanel( $title, "params-page" );
					$_sliders .= $_params->render('params', 'advanced');
					$_sliders .= $_pane->endPanel();
					
					$_sliders .= $_pane->endPane();
					
					$_s = '(<fieldset[^>]*class="adminform">[^<]*?<legend>Parameters</legend>)[\s\S]*?(</fieldset>)';
					$_r = '\1'.$_sliders.'\2';
						
					foreach( $doc->_buffer['component'] as &$_buffer ) {
						$_buffer = preg_replace( '#'.$_s.'#si', $_r, $_buffer );
					}
				}*/
			}
		} else {
			
			$db = &JFactory::getDBO();
			
			if( $app->isSite() ) {
				
				static $pageTitled;
				if(!isset($pageTitled)) {
					$pageTitled = 0;
				}
				
				if($this->addkeyParams->pageTitle and !$pageTitled) {
					$menu = & JSite::getMenu();
					if ($menu->getActive() != $menu->getDefault()) {
						//not frontpage
				        $_page_title = $doc->getTitle();
				        if(JString::strpos($_page_title,$this->addkeyParams->siteName) === false ){
							$this->addkeyParams->pageTitlePos ? $_page_title = $this->addkeyParams->siteName.' '.$this->addkeyParams->pageTitleSep.' '.$_page_title : $_page_title = $_page_title.' '.$this->addkeyParams->pageTitleSep.' '.$this->addkeyParams->siteName;
							$doc->setTitle($_page_title);
				        }
						$pageTitled = 1;
					}
				}
		
				// don't change meta data for article view
				if(JRequest::getVar('view') == JString::trim($this->addkeyParams->exclview)) {
					return;
				} else {
					$Itemid = JRequest::getVar('Itemid');
					$db->setQuery("SELECT params FROM #__menu WHERE id='".intval($Itemid)."'");
					$menu_params = new JParameter($db->loadResult());
				
					if($menu_params->get('meta_description') != '' AND $doc->getDescription() == '') {
						$doc->setDescription($menu_params->get('meta_description'));
					}
					
					if($menu_params->get('meta_keywords') != '') {
						$doc->setMetadata('keywords', $menu_params->get('meta_keywords'));
					}
					
					if($menu_params->get('author') != '') {
						$doc->setMetadata('author', $menu_params->get('author'));
					}
					
					if($menu_params->get('robots') !='') {
						$doc->setMetadata('robots', $menu_params->get('robots'));
					}
				}
			}
		}
	}
	
	private function getXMLParams()
	{
		require_once(JPATH_ADMINISTRATOR.DS.'components'.DS.'com_menus'.DS.'models'.DS.'item.php');

		$item = MenusModelItem::getItem();
		
		$xml_params = new JParameter( $item->params );
		$path = JPATH_SITE.DS.'plugins'.DS.'system'.DS.'addkeywords'.DS.'metadata.xml';
		if (file_exists( $path )) {
			$xml = &JFactory::getXMLParser('Simple');
			if ($xml->loadFile($path)) {
				$xml_document = &$xml->document;
				$xml_params->setXML($xml_document->getElementByPath('state/params'));
			}
		}
		return $xml_params;		
	}

	// keyword and description generation
	public function onBeforeContentSave( &$article, $isNew)
	{
		$meta_data = array();
		
		$meta_data = plgSystemAddKeywords::generateMeta($article, false, false);
		
		// return the modified metadata for posting
		$article->metakey = $meta_data['keywords'];
		$article->metadesc = $meta_data['description'];
		
		// Replace everything, everywhere
		if($this->addkeyParams->doAll == 1) {
			plgSystemAddKeywords::regenerateAll(false, $this->addkeyParams->doDesc, $excluded = $article->id);
		}
		return true;
	}
	
	public function generateMeta($article, $non_object, $doDesc, $processGlobals = true)
	{		
		// Check $non-object to ascertain whether to treat $article as an object or variable
		// Params redefined as this is a call from outside the plugin but able to set whether to do description, $doDesc
		if($non_object) {
			if(!isset($this->addkeyParams)) {
				$plugin = &JPluginHelper::getPlugin('system', 'addkeywords');
				$params = new JParameter( $plugin->params );
				$this->addkeyParams = plgSystemAddKeywords::allParams($params);
			}
			
			if($this->addkeyParams->processPlugins) {
				$article = JHTML::_('content.prepare', $article);
			}
			$getText = strip_tags($article);
			$getKeys = "";
			$getDesc = "";
			
			$keywords = plgSystemAddKeywords::generateKeywords($getKeys, $getText, $article, $processGlobals, $author=false, $sectcat=false);
			
			$doDesc ? $description = plgSystemAddKeywords::generateDescription($getDesc, $getText, $processGlobals) : $description = '';
		} else {
		// $article is an object
			if(!isset($this->addkeyParams)) {
				$plugin = &JPluginHelper::getPlugin('system', 'addkeywords');
				$params = new JParameter( $plugin->params );
				$this->addkeyParams = plgSystemAddKeywords::allParams($params);
			}
		
			// check if we should exclude this
			$endNow = plgSystemAddKeywords::sectionCheck($article->sectionid, $article->catid);
			if($endNow) {
				return;
			}
				
			// Set up variables
			$getKeys = $article->metakey;
			$getDesc = $article->metadesc;
			
			$getTextDesc = $article->introtext. " " .$article->fulltext;
			if($this->addkeyParams->processPlugins) {
				$app = &JFactory::getApplication();
				if($app->isSite()) {
					$getTextDesc = JHTML::_('content.prepare', $getTextDesc);
				}
			}
			$getTextDesc = strip_tags($getTextDesc);
			$this->addkeyParams->useTitle ? $getText = strip_tags($article->title)." ".$getTextDesc : $getText = $getTextDesc;
			
			if($this->addkeyParams->doKeys == 1 OR $this->addkeyParams->doDesc == 1) {
				// See if keywords and/or description should be replaced/updated
				// We're keeping all the existing metadata
				if(JString::strpos($getKeys, "@KEEP") === true AND JString::strpos($getDesc, "@KEEP") === true) {
					$description = JString::trim(str_replace("@KEEP","",$getDesc));
					$keywords = JString::trim(str_replace("@KEEP","",$getKeys));
				} elseif(JString::strpos($getKeys, "@KEEP") === true) {
				// Keep the keywords but replace the description, if set
					$keywords = JString::trim(str_replace("@KEEP","",$getKeys));
					if($this->addkeyParams->doDesc == 1) {
						$description = plgSystemAddKeywords::generateDescription($getDesc, $getTextDesc, $processGlobals);
					}
				} elseif(JString::strpos($getDesc, "@KEEP") === true) {
				// Keep the description but replace the keywords, if set
					$description = JString::trim(str_replace("@KEEP","",$getDesc));
					if($this->addkeyParams->doKeys == 1) {
						$keywords = plgSystemAddKeywords::generateKeywords($getKeys, $getText, $article, $processGlobals);
					}
				} else {
				// Process whole article
					if($this->addkeyParams->doDesc == 1) {
						if($this->addkeyParams->doEmptyDesc == 1) {
							if($getDesc == '') {
								$description = plgSystemAddKeywords::generateDescription($getDesc, $getTextDesc, $processGlobals);
							} else {
								$description = $getDesc;
							}
						} else {
							$description = plgSystemAddKeywords::generateDescription($getDesc, $getTextDesc, $processGlobals);
						}
					}
					
					if($this->addkeyParams->doKeys == 1) {
						if($this->addkeyParams->doEmptyKeys == 1) {
							if($getKeys == '') {
								$keywords = plgSystemAddKeywords::generateKeywords($getKeys, $getText, $article, $processGlobals);
							} else {
								$keywords = $getKeys;
							}
						} else {
							$keywords = plgSystemAddKeywords::generateKeywords($getKeys, $getText, $article, $processGlobals);
						}
					}
				}
			} else {
				// Not processing - see if this should be overridden
				// See if keywords and/or description should be replaced/updated
				// We're processing all metadata
				if(JString::strpos($getKeys, "@PROCESS") === true AND JString::strpos($getDesc, "@PROCESS") === true) {
					$description = JString::trim(str_replace("@PROCESS","",$getDesc));
					$description = plgSystemAddKeywords::generateDescription($getDesc, $getTextDesc, $processGlobals);
					$keywords = JString::trim(str_replace("@PROCESS","",$getKeys));
					$keywords = plgSystemAddKeywords::generateKeywords($getKeys, $getText, $article, $processGlobals);
				} elseif(JString::strpos($getKeys, "@PROCESS") === true) {
				// Process keywords but keep the description
					$keywords = JString::trim(str_replace("@PROCESS","",$getKeys));
					$keywords = plgSystemAddKeywords::generateKeywords($getKeys, $getText, $article, $processGlobals);
					$description = $article->metadesc;
				} elseif(JString::strpos($getDesc, "@PROCESS") === true) {
				// Process the description but keep the keywords
					$description = JString::trim(str_replace("@PROCESS","",$getDesc));
					$description = plgSystemAddKeywords::generateDescription($getDesc, $getTextDesc, $processGlobals);
					$keywords = $article->metakey;
				} else {
				// Don't change anything
					$description = $article->metadesc;
					$keywords = $article->metakey;
				}
			}
		}
		
		$meta_data = array();
		$meta_data['keywords'] = $keywords;
		$meta_data['description'] = $description;

		return $meta_data;
	}
	
	public function regenerateAll($external, $doDesc, $excluded = null)
	{
		if($external){
			if(!isset($this->addkeyParams)) {
				$plugin = &JPluginHelper::getPlugin('system', 'addkeywords');
				$params = new JParameter( $plugin->params );
				$this->addkeyParams = plgSystemAddKeywords::allParams($params);
			}
		}
		
		$db = &JFactory::getDBO();
		$this->addkeyParams->doAllArchived ? $where = "" : $where = "WHERE state >= 0";
		$query = "SELECT COUNT(id) FROM ".$db->nameQuote('#__content');
		$query .= $where;
		$db->setQuery($query);
		$numArticles = $db->loadResult();
		$limitArray = array();
		for($i=0;$numArticles>=0;$numArticles-=500,$i++) {
			if($numArticles<500) {
				$limitArray[$i] = "0,$numArticles";
			} else {
				$limitArray[$i] = ($numArticles-499).",$numArticles";
			}
		}
		
		foreach($limitArray as $value) {	
			$query = "SELECT * FROM ".$db->nameQuote('#__content')." ".$where." LIMIT ".$value."";
			$db->setQuery($query);
			$rows = $db->loadObjectList();
			
			foreach ( $rows as $row ) {
							
				// check if we should exclude this article
				if($row->id == $excluded) {
					$endNow = 1;
				} else {
					$endNow = plgSystemAddKeywords::sectionCheck($row->sectionid, $row->catid);
				}
				
				if(!$endNow) {
					
					$description = '';
					$keywords = '';
					
					if($this->addkeyParams->useTitle) {
						$getTextDesc = strip_tags($row->introtext. " " .$row->fulltext);
						$getText = strip_tags($row->title." ".$getTextDesc);
					} else {
						$getTextDesc = strip_tags($row->introtext. " " .$row->fulltext);
						$getText = strip_tags($getTextDesc);
					}
					
					// create the keywords for the article
					
					if($external) {
						if($doDesc) {
							$description = plgSystemAddKeywords::generateDescription($row->metadesc, $getTextDesc, true);
						}
					} else {
						if($this->addkeyParams->doDesc == 1) {
							if($this->addkeyParams->doEmptyDesc == 1) {
								if($row->metadesc == '') {
									$description = plgSystemAddKeywords::generateDescription($row->metadesc, $getTextDesc, true);
								}
							} else {
								$description = plgSystemAddKeywords::generateDescription($row->metadesc, $getTextDesc, true);
							}
						}
					}
					
					if($external) {
						$keywords = plgSystemAddKeywords::generateKeywords($row->metakey, $getText, $row, true);
					} else {
						if($this->addkeyParams->doKeys == 1) {
							if($this->addkeyParams->doEmptyKeys == 1) {
								if($row->metakey == '') {
									$keywords = plgSystemAddKeywords::generateKeywords($row->metakey, $getText, $row, true);
								}
							} else {
								$keywords = plgSystemAddKeywords::generateKeywords($row->metakey, $getText, $row, true);
							}
						}
					}
							
					if($external) {
						if($doDesc) {
							$query = "UPDATE ".$db->nameQuote('#__content')." SET ".$db->nameQuote('metakey')." = ".$db->Quote($keywords).", ".$db->nameQuote('metadesc')." = ".$db->Quote($description)."";
						} else {
							$query = "UPDATE ".$db->nameQuote('#__content')." SET ".$db->nameQuote('metakey')." = ".$db->Quote($keywords)."";
						}
					} else {
						if($description AND $keywords) {
							$query = "UPDATE ".$db->nameQuote('#__content')." SET ".$db->nameQuote('metakey')." = ".$db->Quote($keywords).", ".$db->nameQuote('metadesc')." = ".$db->Quote($description)."";
						} elseif(!$description AND $keywords) {
							$query = "UPDATE ".$db->nameQuote('#__content')." SET ".$db->nameQuote('metakey')." = ".$db->Quote($keywords)."";
						} elseif($description AND !$keywords) {
							$query = "UPDATE ".$db->nameQuote('#__content')." SET ".$db->nameQuote('metadesc')." = ".$db->Quote($description)."";
						}
					}
					
					if($description OR $keywords) {
						$query .= "WHERE ".$db->nameQuote('id')." = ".$db->Quote($row->id)."";
						$db->setQuery($query);
						$db->query();
					}
				}
			}
		}
		return true;
	}
	
	private function allParams($params)
	{
		$app = &JFactory::getApplication();
		
		$this->addkeyParams = new stdClass;
		
		$this->addkeyParams->menumeta = $params->get('menumeta',1);
		$this->addkeyParams->exclview = $params->get('exclview','article');
		$this->addkeyParams->tags = $params->get('tags',0);
		$this->addkeyParams->tagFieldset = $params->get('tagfieldset',1);
		$this->addkeyParams->frontMenuid = $params->get('frontmenuid','');
		$this->addkeyParams->frontSecid = $params->get('frontsecid','');
		$this->addkeyParams->frontCatid = $params->get('frontcatid','');
		$this->addkeyParams->frontTag = $params->get('fronttag',0);
		$this->addkeyParams->blogTag = $params->get('blogtag',0);
		$this->addkeyParams->tagTitle = $params->get('tagtitle','Tags');
		$this->addkeyParams->numTags = $params->get('numtags',10);
		$this->addkeyParams->searchType = $params->get('searchtype','exact');
		$this->addkeyParams->ulStyle = $params->get('ulstyle','margin:0;');
		$this->addkeyParams->liStyle = $params->get('listyle','display:inline;list-style-type:none;padding: 0 0.5em;');
		$this->addkeyParams->relatedItems = $params->get('relateditems',0);
		$this->addkeyParams->modFieldset = $params->get('modfieldset',1);
		$this->addkeyParams->modTitle = $params->get('modtitle','Related Articles');
		$this->addkeyParams->modName = $params->get('modname','ak_related');
		$this->addkeyParams->modStyle = $params->get('modstyle','none');
		$this->addkeyParams->doKeys = $params->get('dokeys',1);
		$this->addkeyParams->doEmptyKeys = $params->get('doemptykeys',0);
		$this->addkeyParams->preserveKeys = $params->get('preservekeys',0);
		$this->addkeyParams->useTitle = $params->get('usetitle',1);
		$this->addkeyParams->doDesc = $params->get('dodesc',1);
		$this->addkeyParams->doEmptyDesc = $params->get('doemptydesc',0);
		$this->addkeyParams->preserveDesc = $params->get('preservedesc',0);
		$this->addkeyParams->descPrimary = $params->get('descprimary', 'sentence' );
		$this->addkeyParams->descSentCount = $params->get('descsentcount',2);
		$this->addkeyParams->descWordCount = $params->get('descwordcount',20);
		$this->addkeyParams->descCharCount = $params->get('desccharcount',150);
		$this->addkeyParams->doAll = $params->get('regenerateall',0);
		$this->addkeyParams->doAllArchived = $params->get('regenerateallarchived',0);
		$this->addkeyParams->addAuthor = $params->get('addauthor',0);
		$this->addkeyParams->addSectCat = $params->get('addsectcat',0);
		$this->addkeyParams->blackList = $params->get('blacklist', 'a, about, above, across, after, afterwards, again, against, all, almost, alone, along, already, also, although, always, am, among, amongst, amoungst, amount, an, and, another, any, anyhow, anyone, anything, anyway, anywhere, are, around, as, at, back, be, became, because, become, becomes, becoming, been, before, beforehand, behind, being, below, beside, besides, between, beyond, bill, both, bottom, but, by, call, can, cannot, cant, co, computer, con, could, couldnt, cry, de, describe, detail, dis, do, done, down, due, during, each, eg, eight, either, eleven, else, elsewhere, empty, enough, etc, even, ever, every, everyone, everything, everywhere, except, few, fifteen, fify, fill, find, fire, first, five, for, former, formerly, forty, found, four, from, front, full, further, get, give, go, had, has, hasnt, have, he, hence, her, here, hereafter, hereby, herein, hereupon, hers, herself, him, himself, his, how, however, http, hundred, i, ie, if, in, inc, indeed, interest, into, is, it, its, itself, keep, last, latter, latterly, least, less, ltd, made, many, may, me, meanwhile, might, mill, mine, more, moreover, most, mostly, move, much, must, my, myself, name, namely, neither, never, nevertheless, next, nine, no, nobody, none, noone, nor, not, nothing, now, nowhere, of, off, often, on, once, one, only, onto, or, org, other, others, otherwise, our, ours, ourselves, out, over, own, part, per, perhaps, please, put, rather, re, same, see, seem, seemed, seeming, seems, serious, several, she, should, show, side, since, sincere, six, sixty, so, some, somehow, someone, something, sometime, sometimes, somewhere, still, such, system, take, ten, than, that, the, their, them, themselves, then, thence, there, thereafter, thereby, therefore, therein, thereupon, these, they, thick, thin, third, this, those, though, three, through, throughout, thru, thus, to, together, too, top, toward, towards, twelve, twenty, two, un, under, until, up, upon, us, very, via, was, we, well, were, what, whatever, when, whence, whenever, where, whereafter, whereas, whereby, wherein, whereupon, wherever, whether, which, while, whither, who, whoever, whole, whom, whose, why, will, with, within, without, would, www, yet, you, your, yours, yourself, yourselves, s, say, said, says, the' );
		$this->addkeyParams->whiteList = $params->get('whitelist', '');
		$this->addkeyParams->whiteWordWeighting = $params->get('whitewordweighting',5);
		$this->addkeyParams->multiWordWhiteList = $params->get('multiwordwhitelist',1);
		$this->addkeyParams->multiWordWeighting = $params->get('multiwordweighting',5);
		$this->addkeyParams->unsetMultiWord = $params->get('unsetmultiword',1);
		$this->addkeyParams->whiteListOnly = $params->get('whitelistonly', 0);
		$this->addkeyParams->minLength = $params->get('lengthofword',3);
		$this->addkeyParams->keyCount= $params->get('keycount',20);
		$this->addkeyParams->akCategories = $params->get('akcategories','');
		$this->addkeyParams->akSections = $params->get('aksections','');
		$this->addkeyParams->oldphp = $params->get('oldphp',0);
		$this->addkeyParams->dotdotdot = $params->get('dotdotdot','...');
		$this->addkeyParams->newparams = $params->get('newparams',1);
		$this->addkeyParams->processPlugins = $params->get('processplugins',1);
		$this->addkeyParams->addTag = $params->get('addtag',1);
		$this->addkeyParams->addTagUsers = $params->get('addtagusers','Super Administrator');
		$this->addkeyParams->pageTitle = $params->get('pagetitle',1);
		$this->addkeyParams->pageTitleSep = $params->get('titlesep','-');
		$this->addkeyParams->pageTitlePos = $params->get('titlepos',1);
		$this->addkeyParams->siteName = $params->get('titletext',$app->getCfg('sitename'));
		
		return $this->addkeyParams;
	}
		
	private function addAuthor($article,$keywords)
	{
		if($article->created_by_alias != "") {
			if($keywords == "") {
				$keywords .= $article->created_by_alias;
			} else {
				$keywords .= "," . $article->created_by_alias;
			}
		} else {
			$db = &JFactory::getDBO();
			$query = "SELECT ".$db->nameQuote('name')." FROM ".$db->nameQuote('#__users')." WHERE ".$db->nameQuote('id')." = ".$db->Quote($article->created_by)."";
			$db->setQuery($query);
			$author = $db->loadResult();
			if($author) {
				if($keywords == "") {
					$keywords .= $author;
				} else {
					$keywords .= "," . $author;
				}
			}
		}
		return $keywords;
	}
	
	private function addSectCat($article,$keywords,$type)
	{
		$db = &JFactory::getDBO();
		
		switch($type)
		{
			case 'section':
			
			$query = "SELECT ".$db->nameQuote('title')." FROM ".$db->nameQuote('#__sections')." WHERE ".$db->nameQuote('id')." = ".$db->Quote($article->sectionid)."";
			break;
			
			case 'category':
			
			$query = "SELECT ".$db->nameQuote('title')." FROM ".$db->nameQuote('#__categories')." WHERE ".$db->nameQuote('id')." = ".$db->Quote($article->catid)."";
			break;
			
			case 'both':
			
			$query1 = "SELECT ".$db->nameQuote('title')." FROM ".$db->nameQuote('#__sections')." WHERE ".$db->nameQuote('id')." = ".$db->Quote($article->sectionid)."";
			$query2 = "SELECT ".$db->nameQuote('title')." FROM ".$db->nameQuote('#__categories')." WHERE ".$db->nameQuote('id')." = ".$db->Quote($article->catid)."";
			break;
		}
		
		if($type == 'both') {
			$db->setQuery($query1);
			$sect = $db->loadResult();
			if($sect == null) {
				$sect = "Uncategorised";
			}
			$db->setQuery($query2);
			$cat = $db->loadResult();
			if($cat == null) {
				$cat = "Uncategorised";
			}
			
			if($sect AND $cat) {
				$sectcat = $sect.",".$cat;
			} elseif($sect AND !$cat) {
				$sectcat = $sect;
			} elseif($cat AND !$sect) {
				$sectcat = $cat;
			}
			
			if($sectcat) {
				if($keywords == "") {
					$keywords .= $sectcat;
				} else {
					$keywords .= "," . $sectcat;
				}
			}
		} else {
			
			$db->setQuery($query);
			$sectcat = $db->loadResult();
			if($sectcat == null) {
				$sectcat = "Uncategorised";
			}
			
			if($sectcat) {
				if($keywords == "") {
					$keywords .= $sectcat;
				} else {
					$keywords .= "," . $sectcat;
				}
			}
		}
		
		return $keywords;
	}
	
	private function sectionCheck($sectionid, $catid)
	{
		// if this is an excluded section or category, return 0
		if(isset($this->addkeyParams->akSections)) {
			if(is_array($this->addkeyParams->akSections) AND in_array($sectionid, $this->addkeyParams->akSections)) {
				return true;
			} elseif($sectionid == $this->addkeyParams->akSections) {
				return true;
			}
		}
		
		if(isset($this->addkeyParams->akCategories)) {
			if(is_array($this->addkeyParams->akCategories) AND in_array($catid, $this->addkeyParams->akCategories)) {
				return true;
			} elseif($catid == $this->addkeyParams->akCategories) {
				return true;
			}
		}
		
		// otherwise 0 to continue
		return false;
	}
	
	private function fixEncoding(&$text)
	{
		$encoding = mb_detect_encoding($text);
			
		if($encoding == "UTF-8") {
			mb_internal_encoding($encoding);
			mb_regex_encoding($encoding);;
		} else {
			mb_internal_encoding("UTF-8");
			mb_regex_encoding("UTF-8");
			mb_convert_encoding($text,"UTF-8",$encoding);
		}
		return $encoding;
	}
	
	private function revertEncoding(&$text, $encoding)
	{
		mb_convert_encoding($text,$encoding,"UTF-8");
	}
	
	private function cleanWhitespace(&$text)
	{
		$text = str_replace(array("\t","\n","\r","\0","\x0B"), " ", $text);
		while(JString::strpos($text,"  ")) {
			$text = JString::str_ireplace("  ", " ", $text);
		}
	}
	
	private function generateKeywords($oldKeys, $text, $article, $processGlobals, $author=true, $sectcat=true)
	{
		// Keywords to preserve
		if($this->addkeyParams->preserveKeys == 1) {
			//$oldEncoding = plgSystemAddKeywords::fixEncoding($oldKeys);
			$oldKeys = html_entity_decode( $oldKeys, ENT_QUOTES, "UTF-8" );
			if(preg_match('#{([\s\S]*)}#u', $oldKeys, $matches)) {
				$savedKeys = $matches[1];
			}
		} else {
			$savedKeys = null;
		}
				
		//$encoding = plgSystemAddKeywords::fixEncoding($text);
		$text = html_entity_decode( $text, ENT_QUOTES, "UTF-8" );

		// Get rid of &nbsp; - deprecated but kept for pre-PHP5.2 support
		if($this->addkeyParams->oldphp) {
			$replace = array("&nbsp;","&bdquo;","&rdquo;","&rsquo;","&Idquo;","&Isquo;","&ndash;","&quot;");
			$text = JString::str_ireplace($replace, " ", $text);
		}
	
		// Start cleaning up the article text
		//$text = preg_replace('/#<[^>]*>#u', ' ', $text);
	
		// Cleans up plugin calls
		$text = preg_replace('#{[^}]*?}(?(?=[^{]*?{\/[^}]*?})[^{]*?{\/[^}]*?})#u', '', $text);
	
		// Cleans any numbers or punctuation/newlines etc which were causing blanks/dashes etc in the final output
		if($this->addkeyParams->oldphp) {
			$text = preg_replace('#[\d\W]#u', ' ', $text);
		} else {
			// New syntax more forgiving for hyphenated words but may still break them and does not work with PHP <5.2
			// Non-English character safe!
			$text = preg_replace("#\P{L}#u", " ", $text);
		}
	
		// More efficient to change entire string to lower case here than via array_map
		//plgSystemAddKeywords::cleanWhitespace($text);
		$text = preg_replace('#[\s]{2,}#u', ' ', $text);
		
		$text = JString::strtolower($text);

	
		// Get rid of undefined variables errors
		$whiteToAdd = "";
		$whiteToAddArray = array();
		$multiWordWhiteToAddArray = array();
		$keywords = "";
		
		if(isset($this->addkeyParams->multiWordWhiteList)) {
			JString::strtolower($this->addkeyParams->multiWordWhiteList);
			$multiWordWhiteArray = explode(",", $this->addkeyParams->multiWordWhiteList);
		
			foreach($multiWordWhiteArray as $multiWordWhiteWord) {
				$multiWordWhiteWord = JString::trim($multiWordWhiteWord);
				if($multiWordWhiteWord) {
					if($multiWordCount = substr_count($text, $multiWordWhiteWord)) {
						$multiWordCount *= $this->addkeyParams->multiWordWeighting;
						$multiWordWhiteToAddArray[$multiWordWhiteWord] = $multiWordCount;
						if($this->addkeyParams->unsetMultiWord) {
							JString::str_ireplace($multiWordWhiteWord,'',$text);
						}
					}
				}
			}
		}		
		
		if(isset($this->addkeyParams->whiteList)) {
			JString::strtolower($this->addkeyParams->whiteList);
			$whiteArray = explode(",", $this->addkeyParams->whiteList);
		
			foreach($whiteArray as $whiteWord) {
				$whiteWord = JString::trim($whiteWord);
				if($whiteWord) {
					if($whiteWordCount = substr_count($text, $whiteWord)) {
						$whiteWordCount *= $this->addkeyParams->whiteWordWeighting;
						$whiteToAddArray[$whiteWord] = $whiteWordCount;
						JString::str_ireplace($whiteWord,'',$text);
					}
				}
			}
		}
		
		if($this->addkeyParams->whiteListOnly) {
			$textArray = array();
		} else {
			$textArray = explode(" ", $text);
			$textArray = array_count_values($textArray);
			
			// Remove blacklisted words
			JString::strtolower($this->addkeyParams->blackList);
			$blackArray = explode(",", $this->addkeyParams->blackList);
			
			foreach($blackArray as $blackWord) {
				if(isset($textArray[JString::trim($blackWord)])) {
					unset($textArray[JString::trim($blackWord)]);
				}
			}
		}
		
		$textArray = array_merge($textArray,$whiteToAddArray,$multiWordWhiteToAddArray);
		
		// Sort by frequency
		arsort($textArray);
		
		$i = 1;
		
		foreach($textArray as $word=>$instances) {
			if($i > $this->addkeyParams->keyCount)
				break;
			if(strlen(JString::trim($word)) >= $this->addkeyParams->minLength ) {
				if(!isset($keywordsIn)) {
					$keywordsIn = array();
				}
				$keywordsIn[] = JString::trim($word);
				$i++;
			}
		}
				
		// Make the vars whiteToAdd and keywords, add in the whitelist words
		if(isset($keywordsIn)) {
			$keywords = implode(",",$keywordsIn);
		}
	
		// Add in the preserved meta keywords
		if(isset($savedKeys)) {
			//plgSystemAddKeywords::revertEncoding($this->addkeyParams->preserveKeyMeta,$oldEncoding);
			$keywords .= ", ".$savedKeys;
		}
		
		// add the author or author alias as a keyword if desired
		if($author) {
			if($this->addkeyParams->addAuthor == 1) {
				$keywords = plgSystemAddKeywords::addAuthor($article, $keywords);
			}
		}
		
		// add section/category if set
		if($sectcat) {
			if($this->addkeyParams->addSectCat) {
				$keywords = plgSystemAddKeywords::addSectCat($article, $keywords, $this->addkeyParams->addSectCat);
			}
		}
		
		if($processGlobals) {
			$this->akProcessKeys = 1;
		}
		
		//Do we need to revert encoding for non-English characters?
		//plgSystemAddKeywords::revertEncoding($keywords,$encoding);
		return JString::trim(JString::strtolower($keywords));
	}
	
	private function generateDescription($oldDesc, $text, $processGlobals)
	{
		// Description to preserve
		if($this->addkeyParams->preserveDesc == 1) {
			//$oldEncoding = plgSystemAddKeywords::fixEncoding($oldDesc);
			$oldDesc = html_entity_decode( $oldDesc, ENT_QUOTES, "UTF-8" );
			plgSystemAddKeywords::cleanWhitespace($oldDesc);
			if(preg_match('#{([^}][\s\S]*)}#u', $oldDesc, $matches)) {
				$savedDesc = $matches[1];
				if(JString::strpos($savedDesc,"[start]")) {
					$position = "start";
					$savedDesc = JString::str_ireplace("[start]","",$savedDesc);
				} else {
					$position = "end";
				}
			}
		}
		
		//$encoding = plgSystemAddKeywords::fixEncoding($text);
		$text = html_entity_decode($text, ENT_QUOTES, "UTF-8" );
	
		// Start cleaning up the article text
		//$text = strip_tags($text);

		// Cleans up plugin calls
		$text = preg_replace('#{[^}]*?}(?(?=[^{]*?{\/[^}]*?})[^{]*?{\/[^}]*?})#u', '', $text);
		
		// Get rid of all forms of whitespace except single spaces
		//plgSystemAddKeywords::cleanWhitespace($text);
		$text = preg_replace('#[\s]{2,}#u', ' ', $text);
		
		// Use sentence, word or char count to make description
		// Char count is now the fallback method
		if($this->addkeyParams->descPrimary == 'sentence') {
			// Setup pattern to find sentences and create description depending on defined number of sentences
			$description = "";
			$pattern = '#\b(.+?[\.|\!|\?])#u';
			
			for($i=0; $i<$this->addkeyParams->descSentCount; $i++) {
				$offset = "";
				if(preg_match($pattern,$text,$matches)) {
					$match = $matches[1];
				} else {
					break;
				}
				
				$description .= " ".$match;
		
				$offset = JString::strpos($text,$match);
				$offset += strlen($match);
				$text = JString::substr($text,$offset);
			}
		}
		
		if($this->addkeyParams->descPrimary == 'word') {
		    $explode = explode(' ',JString::trim($text)); 
	    	$string = ''; 
	    
	    	for($i=0;$i<$this->addkeyParams->descWordCount;$i++) { 
	        	if(isset($explode[$i])) {
		        	$string .= $explode[$i]." ";
	    		} else {
	    			break;
	    		} 
	    	} 
	        $description = JString::trim($string); 
		}
		
		// If description is null, fallback to char count
		if($this->addkeyParams->descPrimary == 'char' OR $description == '') {
			$description = JString::substr(JString::trim($text),0,$this->addkeyParams->descCharCount);
		}
	
		// Add in the preserved description
		if(isset($savedDesc)) {
			if($position == "start") {
				$description = JString::trim($savedDesc)." ".JString::trim($description);
			} elseif($position == "end") {
				$description = JString::trim($description)." ".JString::trim($savedDesc);
			}
		}
		
		if($this->addkeyParams->dotdotdot) {
			if(!JString::strpos($description,'...')) {
				$description .= '...';
			}
		}
		
		if($processGlobals) {
			$this->akProcessDesc = 1;
		}
				
		return JString::trim($description);
	}
}