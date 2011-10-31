<<<<<<< HEAD
-- phpMyAdmin SQL Dump
-- version 3.1.3.1
=======
﻿-- phpMyAdmin SQL Dump
-- version 3.1.1
>>>>>>> d819b72db841e7915fedb0205f79fe034e105b97
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 29, 2011 at 09:38 AM
-- Server version: 5.1.33
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wesharearticles`
--

-- --------------------------------------------------------

--
-- Table structure for table `jos_articles_liked`
--

CREATE TABLE IF NOT EXISTS `jos_articles_liked` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viewer_id` int(11) NOT NULL,
  `article_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  KEY `viewer_id` (`viewer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_articles_liked`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_articles_ratings`
--

CREATE TABLE IF NOT EXISTS `jos_articles_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viewer_id` int(11) NOT NULL,
  `article_id` int(11) unsigned NOT NULL,
  `rating_value` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `viewer_id` (`viewer_id`,`article_id`),
  KEY `article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_articles_ratings`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_article_comments`
--

CREATE TABLE IF NOT EXISTS `jos_article_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) unsigned NOT NULL,
  `comments` varchar(500) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_article_comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_article_read`
--

CREATE TABLE IF NOT EXISTS `jos_article_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viewer_id` int(11) NOT NULL,
  `article_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `viewer_id` (`viewer_id`,`article_id`),
  KEY `article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_article_read`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_article_section`
--

CREATE TABLE IF NOT EXISTS `jos_article_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `section_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  KEY `section_id` (`section_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_article_section`
--

INSERT INTO `jos_article_section` (`id`, `article_id`, `section_id`) VALUES
(1, 26, 10);

-- --------------------------------------------------------

--
-- Table structure for table `jos_article_tags`
--

CREATE TABLE IF NOT EXISTS `jos_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`,`tag_id`),
  KEY `article_id_2` (`article_id`),
  KEY `tag_id` (`tag_id`),
  KEY `tag_id_2` (`tag_id`),
  KEY `article_id_3` (`article_id`),
  KEY `article_id_4` (`article_id`),
  KEY `article_id_5` (`article_id`),
  KEY `tag_id_3` (`tag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jos_article_tags`
--

INSERT INTO `jos_article_tags` (`id`, `article_id`, `tag_id`) VALUES
(2, 1, 1),
(4, 1, 2),
(5, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jos_author_articles`
--

CREATE TABLE IF NOT EXISTS `jos_author_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `article_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`,`article_id`),
  KEY `article_id` (`article_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_author_articles`
--

INSERT INTO `jos_author_articles` (`id`, `author_id`, `article_id`) VALUES
(1, 62, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_author_rating`
--

CREATE TABLE IF NOT EXISTS `jos_author_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viewer_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `rating` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `viewer_id` (`viewer_id`,`author_id`),
  KEY `author_id` (`author_id`),
  KEY `rating` (`rating`),
  KEY `rating_2` (`rating`),
  KEY `author_id_2` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_author_rating`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_banner`
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT 'banner',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `showBanner` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_banner`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_bannerclient`
--

CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` time DEFAULT NULL,
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_bannerclient`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_bannertrack`
--

CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_bannertrack`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_categories`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_components`
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_menu_link` varchar(255) NOT NULL DEFAULT '',
  `admin_menu_alt` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `admin_menu_img` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 0),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=1\nshow_title=1\nlink_titles=1\nshow_intro=1\nshow_section=1\nlink_section=1\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=1\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\nfilter_groups=18|19\nfilter_type=WL\nfilter_tags=b,i,em\nfilter_attritbutes=href\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, '', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1),
(37, 'AKSEO', '', 0, 0, '', 'AKSEO', 'com_akseo', 0, '', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_contact_details`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_content`
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title_alias` varchar(255) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `video` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '1',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `activate` tinyint(2) NOT NULL DEFAULT '0',
  `article_type` enum('D','P','U') NOT NULL DEFAULT 'D',
  `metadata` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `video`, `filename`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `activate`, `article_type`, `metadata`) VALUES
(1, 'php', 'php', 'html', '<p>dsgdfgshhf  dfhh fgh fghasdgsagdhsgfu gdsgafuf  gafhjgfhjgfjlffffffdhjghgh dghgsdhfg hghsdgf hgdhasgfhgfhghfghagfjhghghg  dsghfghjdsghfjgjagfuaefb  uisadggfigusgf uasdgf gdisaguf uiasudfd  fyuasgdu fgugf auisdgfugsufgdsg f usd fu sduf alsdufidgfu g;a hsduf usdu  ausgdfu gudsg uuisdg fgasidgf sua sa dgg dasuidu uias;g duau usadufg  asudg fgdu uiasggfy7gsdfabhgub gasduifkjasdfvugusad aus igdf asbk 89as  dhaksg diuagsi ugdsgf gasdfggfasbd fjgasuidgfig uisgdfi</p>\r\n<p> </p>\r\n', '\r\n<p> </p>\r\n<p><img src="images/stories/food/coffee.jpg" border="0" />codshja gudgsg fasgf asgdf gasjghd aisgd sa dg absditQHWY6RS VGv das sald ga sdgasc vcxvyu VTzx fkuixjJXicsduyfudsvvyfX gfsx FZXbvUZCbxbchxchjB FZXfcgB gZVXCFbVZXHcXZCbvuvvxvc hXJCvXvchxb c ubcvxhjglbzxcbvxcvdvfuydhcvhcv</p>\r\n<p> </p>', 'no', 'xls', 1, 3, 0, 1, '1999-11-30 00:00:00', 62, '', '2011-10-15 12:21:46', 62, 0, '0000-00-00 00:00:00', '1999-11-30 00:00:00', '0000-00-00 00:00:00', 'no', 'no', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 20, 0, 2, '', '', 1, 11, 0, 'D', 'robots=\nauthor='),
(2, 'web design', 'web-design', '', '<p><img src="images/stories/clock.jpg" border="0" /></p>\r\n<p> </p>\r\n<p>dsgdfgshhf  dfhh fgh fghasdgsagdhsgfu gdsgafuf  gafhjgfhjgfjlffffffdhjghgh dghgsdhfg hghsdgf hgdhasgfhgfhghfghagfjhghghg  dsghfghjdsghfjgjagfuaefb  uisadggfigusgf uasdgf gdisaguf uiasudfd  fyuasgdu fgugf auisdgfugsufgdsg f usd fu sduf alsdufidgfu g;a hsduf usdu  ausgdfu gudsg uuisdg fgasidgf sua sa dgg dasuidu uias;g duau usadufg  asudg fgdu uiasggfy7gsdfabhgub gasduifkjasdfvugusad aus igdf asbk 89as  dhaksg diuagsi ugdsgf gasdfggfasbd fjgasuidgfig uisgdfi</p>\r\n<p>dsgdfgshhf  dfhh fgh fghasdgsagdhsgfu gdsgafuf  gafhjgfhjgfjlffffffdhjghgh dghgsdhfg hghsdgf hgdhasgfhgfhghfghagfjhghghg  dsghfghjdsghfjgjagfuaefb  uisadggfigusgf uasdgf gdisaguf uiasudfd  fyuasgdu fgugf auisdgfugsufgdsg f usd fu sduf alsdufidgfu g;a hsduf usdu  ausgdfu gudsg uuisdg fgasidgf sua sa dgg dasuidu uias;g duau usadufg  asudg fgdu uiasggfy7gsdfabhgub gasduifkjasdfvugusad aus igdf asbk 89as  dhaksg diuagsi ugdsgf gasdfggfasbd fjgasuidgfig uisgdfi</p>\r\n<p>dsgdfgshhf  dfhh fgh fghasdgsagdhsgfu gdsgafuf  gafhjgfhjgfjlffffffdhjghgh dghgsdhfg hghsdgf hgdhasgfhgfhghfghagfjhghghg  dsghfghjdsghfjgjagfuaefb  uisadggfigusgf uasdgf gdisaguf uiasudfd  fyuasgdu fgugf auisdgfugsufgdsg f usd fu sduf alsdufidgfu g;a hsduf usdu  ausgdfu gudsg uuisdg fgasidgf sua sa dgg dasuidu uias;g duau usadufg  asudg fgdu uiasggfy7gsdfabhgub gasduifkjasdfvugusad aus igdf asbk 89as  dhaksg diuagsi ugdsgf gasdfggfasbd fjgasuidgfig uisgdfi</p>\r\n<p>dsgdfgshhf  dfhh fgh fghasdgsagdhsgfu gdsgafuf  gafhjgfhjgfjlffffffdhjghgh dghgsdhfg hghsdgf hgdhasgfhgfhghfghagfjhghghg  dsghfghjdsghfjgjagfuaefb  uisadggfigusgf uasdgf gdisaguf uiasudfd  fyuasgdu fgugf auisdgfugsufgdsg f usd fu sduf alsdufidgfu g;a hsduf usdu  ausgdfu gudsg uuisdg fgasidgf sua sa dgg dasuidu uias;g duau usadufg  asudg fgdu uiasggfy7gsdfabhgub gasduifkjasdfvugusad aus igdf asbk 89as  dhaksg diuagsi ugdsgf gasdfggfasbd fjgasuidgfig uisgdfi</p>\r\n<p>dsgdfgshhf  dfhh fgh fghasdgsagdhsgfu gdsgafuf  gafhjgfhjgfjlffffffdhjghgh dghgsdhfg hghsdgf hgdhasgfhgfhghfghagfjhghghg  dsghfghjdsghfjgjagfuaefb  uisadggfigusgf uasdgf gdisaguf uiasudfd  fyuasgdu fgugf auisdgfugsufgdsg f usd fu sduf alsdufidgfu g;a hsduf usdu  ausgdfu gudsg uuisdg fgasidgf sua sa dgg dasuidu uias;g duau usadufg  asudg fgdu uiasggfy7gsdfabhgub gasduifkjasdfvugusad aus igdf asbk 89as  dhaksg diuagsi ugdsgf gasdfggfasbd fjgasuidgfig uisgdfi</p>\r\n<p>dsgdfgshhf  dfhh fgh fghasdgsagdhsgfu gdsgafuf  gafhjgfhjgfjlffffffdhjghgh dghgsdhfg hghsdgf hgdhasgfhgfhghfghagfjhghghg  dsghfghjdsghfjgjagfuaefb  uisadggfigusgf uasdgf gdisaguf uiasudfd  fyuasgdu fgugf auisdgfugsufgdsg f usd fu sduf alsdufidgfu g;a hsduf usdu  ausgdfu gudsg uuisdg fgasidgf sua sa dgg dasuidu uias;g duau usadufg  asudg fgdu uiasggfy7gsdfabhgub gasduifkjasdfvugusad aus igdf asbk 89as  dhaksg diuagsi ugdsgf gasdfggfasbd fjgasuidgfig uisgdficgnvbhmb,mc,</p>\r\n<p> </p>\r\n<p> </p>\r\n<p>ashfhsaku asdu ufsg fgasgdfgagshj gdasgdh gigsa asgd iasd fgas gfasgd ta agsd f hdfga  asgdf</p>\r\n<p> </p>\r\n<p> </p>', '', '', '', 1, 3, 0, 1, '2011-10-11 07:32:13', 62, '', '2011-10-15 18:22:42', 62, 0, '0000-00-00 00:00:00', '2011-10-11 07:32:13', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 50, 0, 5, '', '', 0, 1, 0, 'D', 'robots=\nauthor='),
(3, 'gfjfjmkmm', 'bvnbvn', '', '<p>vbcmvmc</p>', '', '', '', -2, 2, 0, 1, '2011-10-11 10:19:44', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-10-11 10:19:44', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 0, '', '', 0, 0, 0, 'D', 'robots=\nauthor='),
(4, 'cvnxcvn', 'xcvncvn', '', '<p>cvbxcvnxcvn</p>', '', '', '', 1, 3, 0, 1, '2011-10-11 11:36:43', 62, '', '2011-10-14 14:15:44', 62, 0, '0000-00-00 00:00:00', '2011-10-11 11:36:43', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 3, '', '', 0, 5, 0, 'D', 'robots=\nauthor='),
(5, 'dhanapal', 'dhanapal', '', '<p>sdfhgdhsfghhb vlxfb klxncvk s sdnf dm f oigea  dfvidig basbdbi siudabuads iuiasd uiksdugasdnuig suggsdf iusadfg ZJXI dgsdbasgh YGZxcuzxh dsfsaag</p>', '', '', '', 1, 3, 0, 1, '2011-10-11 13:59:42', 62, '', '2011-10-15 12:23:01', 62, 0, '0000-00-00 00:00:00', '2011-10-11 13:59:42', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 12, 0, 4, '', '', 0, 9, 0, 'D', 'robots=\nauthor='),
(6, 'css', 'css', '', '<p>dfdgdfhfghhghdfhh</p>', '', '', '', 1, 0, 0, 1, '2011-10-11 14:25:19', 62, '', '2011-10-14 07:53:56', 62, 0, '0000-00-00 00:00:00', '2011-10-11 14:25:19', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 10, 0, 6, '', '', 0, 17, 0, 'D', 'robots=\nauthor='),
(7, 'cv cncb', 'cv-cncb', '', '<p>bvnbvn</p>', '', '', '', 1, 2, 0, 1, '2011-10-12 09:05:04', 62, '', '2011-10-15 09:43:23', 62, 0, '0000-00-00 00:00:00', '2011-10-12 09:05:04', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 19, 0, 1, '', '', 0, 9, 0, 'D', 'robots=\nauthor='),
(8, 'maries', 'maries', '', '<p>dgffjh hfg khjk ghf khgf</p>', '', '', '', 1, 3, 0, 0, '2011-10-12 09:46:21', 62, '', '2011-10-15 13:09:46', 62, 0, '0000-00-00 00:00:00', '2011-10-12 09:46:21', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 9, 0, 18, '', '', 0, 4, 0, 'D', 'robots=\nauthor='),
(9, 'naren', 'naren', '', '<p>fghgjhk gh khj ghk hj</p>', '', '', '', 1, 2, 0, 0, '2011-10-12 09:53:57', 62, '', '2011-10-14 14:15:56', 62, 0, '0000-00-00 00:00:00', '2011-10-12 09:53:57', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 12, 0, 15, '', '', 0, 0, 0, 'D', 'robots=\nauthor='),
(10, 'c++', 'c', '', '<p>sfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knf</p>\r\n', '\r\n<p><img src="images/stories/fruit/pears.jpg" border="0" />sfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g   sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn  knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g   sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn  knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g   sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn  knfsfdgh d fdfgdmfsm;g  sdnfks ndfn sdnk nfkn knfsfdgh d fdfgdmfsm;g   sdnfks ndfn sdnk nfkn kn</p>\r\n<p> </p>', '', '', 1, 2, 0, 0, '2011-10-12 12:40:58', 62, '', '2011-10-15 18:29:23', 62, 0, '0000-00-00 00:00:00', '2011-10-12 12:40:58', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 14, '', '', 0, 0, 0, 'D', 'robots=\nauthor='),
(11, 'RDBMS', 'rdbms', '', '<p>dsgfdgfdhfghj hjk jlkj;lkfdfdfd</p>', '', '', '', 1, 0, 0, 0, '2011-10-12 12:50:39', 62, '', '2011-10-15 06:46:54', 62, 62, '2011-10-28 04:17:45', '2011-10-12 12:50:39', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 19, '', '', 1, 1, 0, 'D', 'robots=\nauthor='),
(12, 'sdghasd', 'sdghasd', '', '<p>asfsfa</p>', '', '', '', 1, 0, 0, 0, '2011-10-15 12:50:43', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-10-15 12:50:43', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 0, 0, 'D', 'robots=\nauthor='),
(13, 'dhana', 'dhana', '', '<p>sfdsfdfa</p>', '', '', '', 1, 0, 0, 0, '2011-10-15 12:51:24', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-10-15 12:51:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 4, 0, 'D', 'robots=\nauthor='),
(14, 'ddg', 'ddg', '', '<p>fdgghdgsx</p>', '', '', '', 1, 0, 0, 0, '2011-10-15 13:20:00', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-10-15 13:20:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 2, 0, 'D', 'robots=\nauthor='),
(15, 'nnnarennnn', 'nnnarennnn', '', '<p>hmh</p>', '', '', '', 1, 2, 0, 0, '2011-10-15 14:12:51', 62, '', '2011-10-15 14:18:24', 62, 0, '0000-00-00 00:00:00', '2011-10-15 14:12:51', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 16, '', '', 0, 1, 0, 'D', 'robots=\nauthor='),
(16, 'rajavel', 'rajavel', '', '<p>dsds</p>', '', '', '', 1, 0, 0, 0, '2011-10-15 15:14:17', 62, '', '2011-10-15 18:23:09', 62, 0, '0000-00-00 00:00:00', '2011-10-15 15:14:17', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 17, '', '', 0, 0, 0, 'D', 'robots=\nauthor='),
(17, 'keerthana', 'keerthana', '', '<p>hi dear</p>', '', '', '', 1, 0, 0, 0, '2011-10-15 18:23:20', 62, '', '2011-10-16 07:34:53', 62, 0, '0000-00-00 00:00:00', '2011-10-15 18:23:20', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 9, 0, 10, '', '', 0, 2, 0, 'D', 'robots=\nauthor='),
(18, 'sharmila', 'sharmila', '', '<p>barjtkru  yrkuuuuuuuuuuuuuuuuuuuuu ASXNqasxcASCas aSXasbxcjasbnl  asXCAS.xcASCKJask asCas cas casc ASX ASCas cAS ASXCascASC.ASC  asxcasC.KasxcasCas ascXACAS</p>\r\n<p> </p>\r\n', '\r\n<p> </p>\r\n<p> </p>\r\n<p><img src="images/stories/320730_133389720089698_100002560113114_169877_2745349_n.jpg" border="0" align="right" /></p>', '', '', 1, 0, 0, 0, '2011-10-15 18:30:46', 63, '', '2011-10-29 06:56:43', 62, 0, '0000-00-00 00:00:00', '2011-10-15 18:30:46', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=hi\nreadmore=', 16, 0, 8, 'aaaaa', '', 0, 8, 0, 'D', 'robots=\nauthor='),
(19, 'xcxcv ', 'xcxcv-', '', '<p>vbvfbfbn gfngfngfn dgfngfnghf  dfmghmghm ghmghmghmh</p>', '', '', '', 1, 0, 0, 0, '2011-10-16 12:26:35', 62, '', '2011-10-16 12:38:04', 62, 0, '0000-00-00 00:00:00', '2011-10-16 12:26:35', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 11, '', '', 0, 2, 0, 'D', 'robots=\nauthor='),
(20, 'Aarthicle', 'aarthicle', '', '<p>\r\n', '\r\nAarthicle</p>', '', '', 1, 0, 0, 0, '2011-10-16 18:24:56', 62, '', '2011-10-19 06:31:57', 62, 0, '0000-00-00 00:00:00', '2011-10-16 18:24:56', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 13, '', '', 0, 1, 0, 'D', 'robots=\nauthor='),
(21, 'java', 'java', '', '<p>this is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is maries</p>\r\n', '\r\n<p>this is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is mariesthis is maries</p>\r\n<hr />\r\n<p> </p>', '', '', 1, 0, 0, 0, '2011-10-15 04:58:07', 62, '', '2011-10-19 08:06:52', 62, 0, '0000-00-00 00:00:00', '2011-10-15 04:58:07', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 2, '', '', 1, 3, 0, 'D', 'robots=\nauthor='),
(22, 'XML', 'xml', '', '<p>XML- Extended Markup Language</p>', '', '', '', 1, 0, 0, 0, '2011-10-15 05:07:42', 62, '', '2011-10-15 10:31:51', 62, 0, '0000-00-00 00:00:00', '2011-10-15 05:07:42', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 4, '', '', 0, 8, 0, 'D', 'robots=\nauthor='),
(23, 'NEW', 'new', '', '<p>BGFBNGFNGMNGHMNGHMNGHMGH</p>', '', '', '', 1, 0, 0, 0, '2011-10-15 07:47:22', 62, '', '2011-10-15 17:24:48', 62, 0, '0000-00-00 00:00:00', '2011-10-15 07:47:22', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 15, 0, 12, '', '', 0, 1, 0, 'D', 'robots=\nauthor='),
(24, 'csasc', 'csasc', '', '<p>gfewgew</p>', '', '', '', 1, 0, 0, 0, '2011-10-15 11:09:34', 62, '', '2011-10-15 17:21:20', 62, 0, '0000-00-00 00:00:00', '2011-10-15 11:09:34', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 9, '', '', 0, 1, 0, 'D', 'robots=\nauthor='),
(25, 'vcdsv', 'vcdsv', '', '<p>dsvdsvdsvdf</p>', '', '', '', 0, 0, 0, 0, '2011-10-15 11:35:41', 62, '', '2011-10-16 06:53:18', 62, 0, '0000-00-00 00:00:00', '2011-10-15 00:00:00', '2011-10-15 11:32:53', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 13, 0, 7, '', '', 0, 1, 0, 'D', 'robots=\nauthor='),
(26, 'maries', 'maries', '', '<table class="contentpaneopen " style="background-color: transparent; border-width: 0px; font-family: inherit; font-size: 13px; font-style: inherit; font-weight: inherit; margin: 0px; padding: 0px; outline-width: 0px; vertical-align: baseline; border-collapse: collapse; height: 36px;" border="0" width="297">\r\n<tbody style="background-color: transparent; border-width: 0px; font-family: inherit; font-size: 13px; font-style: inherit; font-weight: inherit; margin: 0px; padding: 0px; outline-width: 0px; vertical-align: baseline;">\r\n<tr style="background-color: transparent; border-width: 0px; font-family: inherit; font-size: 13px; font-style: inherit; font-weight: inherit; margin: 0px; padding: 0px; outline-width: 0px; vertical-align: baseline;">\r\n<td style="background-color: transparent; border-width: 0px; font-family: inherit; font-size: 13px; font-style: inherit; font-weight: inherit; margin: 0px; padding: 0px; outline-width: 0px; vertical-align: baseline;" valign="top"><span class="Apple-style-span" style="color: #555555; font-family: Helvetica,Arial,sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; background-color: #ffffff;"> </span> \r\n<table class="contentpaneopen " border="0">\r\n<tbody>\r\n<tr style="background-color: transparent; border-width: 0px; font-family: inherit; font-size: 13px; font-style: inherit; font-weight: inherit; margin: 0px; padding: 0px; outline-width: 0px; vertical-align: baseline;">\r\n<td style="background-color: transparent; border-width: 0px; font-family: inherit; font-size: 13px; font-style: inherit; font-weight: inherit; margin: 0px; padding: 0px; outline-width: 0px; vertical-align: baseline;" valign="top">\r\n<p style="margin-top: 10px; margin-bottom: 10px;">Add Keywords is simple to use. Follow the steps:</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n<tr style="background-color: transparent; border-width: 0px; font-family: inherit; font-size: 13px; font-style: inherit; font-weight: inherit; margin: 0px; padding: 0px; outline-width: 0px; vertical-align: baseline;">\r\n<td class="modifydate" style="background-color: transparent; border-width: 0px; font-family: inherit; font-size: 13px; font-style: inherit; font-weight: inherit; margin: 0px; padding: 0px; outline-width: 0px; vertical-align: baseline; display: block;"><br /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n', '\r\n<p> </p>\r\n<table class="contentpaneopen " border="0">\r\n<tbody>\r\n<tr style="background-color: transparent; border-width: 0px; font-family: inherit; font-size: 13px; font-style: inherit; font-weight: inherit; margin: 0px; padding: 0px; outline-width: 0px; vertical-align: baseline;">\r\n<td style="background-color: transparent; border-width: 0px; font-family: inherit; font-size: 13px; font-style: inherit; font-weight: inherit; margin: 0px; padding: 0px; outline-width: 0px; vertical-align: baseline;" valign="top">\r\n<p style="margin-top: 10px; margin-bottom: 10px;">Add Keywords is simple to use. Follow the steps:</p>\r\n<ol>\r\n<li style="background-color: transparent; border-width: 0px; font-family: inherit; font-size: 13px; font-style: inherit; font-weight: inherit; margin: 0px; padding: 0px; outline-width: 0px; vertical-align: baseline;">Install via the Joomla! menu<span class="Apple-converted-space"> </span><em>Extensions-&gt;Install/Uninstall</em></li>\r\n<li style="background-color: transparent; border-width: 0px; font-family: inherit; font-size: 13px; font-style: inherit; font-weight: inherit; margin: 0px; padding: 0px; outline-width: 0px; vertical-align: baseline;">Publish the plugin in<span class="Apple-converted-space"> </span><em>Extensions-&gt;Plugin Manager<span class="Apple-converted-space"> </span></em>(it will be listed as System - Add Keywords)</li>\r\n<li style="background-color: transparent; border-width: 0px; font-family: inherit; font-size: 13px; font-style: inherit; font-weight: inherit; margin: 0px; padding: 0px; outline-width: 0px; vertical-align: baseline;">For basic functions, that''s it!</li>\r\n</ol>Add  Keywords will now parse the text of your article and generate a list of  the most frequently occurring words whenever you save it from either  the front- or back-end of your site. These words will then be compared  to the blacklist and whitelist. Any words that match the whitelist are  given priority and moved to the top of the list Any words that match the  blacklist will be removed from the list. The list is then saved as the  keyword metadata.</td>\r\n</tr>\r\n</tbody>\r\n</table>', '', '', 1, 0, 0, 0, '2011-10-19 06:29:31', 62, '', '2011-10-29 09:37:07', 62, 0, '0000-00-00 00:00:00', '2011-10-19 06:29:31', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 13, 0, 1, 'hai, my, dearsss', 'This is maries', 0, 5, 0, 'D', 'robots=\nauthor=');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_frontpage`
--

INSERT INTO `jos_content_frontpage` (`content_id`, `ordering`) VALUES
(23, 17),
(19, 20),
(25, 14),
(20, 18),
(18, 21),
(21, 15),
(8, 19),
(24, 16),
(17, 22),
(11, 13),
(16, 12),
(12, 11),
(14, 10),
(13, 9),
(22, 8),
(6, 7),
(10, 6),
(9, 5),
(15, 4),
(1, 3),
(7, 2),
(26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_rating`
--

INSERT INTO `jos_content_rating` (`content_id`, `rating_sum`, `rating_count`, `lastip`) VALUES
(2, 3, 1, '127.0.0.1'),
(1, 3, 1, '127.0.0.1'),
(7, 3, 1, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_value` varchar(240) NOT NULL DEFAULT '0',
  `value` varchar(240) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0),
(11, 'users', '63', 0, 'naren', 0),
(12, 'users', '64', 0, 'dhanapal', 0),
(13, 'users', '65', 0, 'dhanapal', 0),
(14, 'users', '66', 0, 'Maries', 0),
(15, 'users', '67', 0, 'fddfdf', 0),
(16, 'users', '68', 0, 'Maries', 0),
(17, 'users', '69', 0, 'Maries', 0),
(18, 'users', '70', 0, 'Magedgg', 0),
(19, 'users', '71', 0, 'mmmmm', 0),
(20, 'users', '74', 0, 'Naren', 0),
(21, 'users', '75', 0, 'NARENNNNNN', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(230) NOT NULL DEFAULT '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_aro_map`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(230) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_groups_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(240) NOT NULL DEFAULT '',
  `aro_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(18, '', 15),
(18, '', 16),
(18, '', 17),
(18, '', 18),
(18, '', 19),
(18, '', 20),
(18, '', 21),
(19, '', 11),
(19, '', 12),
(19, '', 13),
(19, '', 14),
(25, '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_items`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL DEFAULT '0000-00-00',
  `item_table` varchar(50) NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_log_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_log_searches`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_groups`
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text,
  `type` varchar(50) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `componentid` int(11) unsigned NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `browserNav` tinyint(4) DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `utaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL DEFAULT '0',
  `rgt` int(11) unsigned NOT NULL DEFAULT '0',
  `home` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'Home', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu_types`
--

CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site');

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages`
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) unsigned NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jos_messages`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_messages_cfg`
--

INSERT INTO `jos_messages_cfg` (`user_id`, `cfg_name`, `cfg_value`) VALUES
(62, 'lock', '0'),
(62, 'mail_on_new', '0'),
(62, 'auto_purge', '1');

-- --------------------------------------------------------

--
-- Table structure for table `jos_migration_backlinks`
--

CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_migration_backlinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `numnews` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `control` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Main Menu', '', 1, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmoduleclass_sfx=_menu\n', 1, 0, ''),
(2, 'Login', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Recent added Articles', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 0, 'mod_stats', 0, 2, 0, '', 0, 1, ''),
(6, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Logged in Users', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Admin Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'User Status', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Title', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(16, 'User Login', '', 0, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, 'cache=0\nmoduleclass_sfx=\npretext=\nposttext=\nlogin=1\nlogout=1\ngreeting=1\nname=0\nusesecure=1\n\n', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(11) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(11) unsigned NOT NULL DEFAULT '3600',
  `checked_out` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_newsfeeds`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_plugins`
--

CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `element` varchar(100) NOT NULL DEFAULT '',
  `folder` varchar(100) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `jos_plugins`
--

INSERT INTO `jos_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Authentication - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Authentication - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Authentication - GMail', 'gmail', 'authentication', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Authentication - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'User - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Search - Content', 'content', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Search - Contacts', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Search - Categories', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Search - Sections', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Search - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Search - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Content - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Content - Rating', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Content - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Content - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Content - Load Module', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
(17, 'Content - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'mode=advanced\nskin=0\ncompressed=0\ncleanup_startup=0\ncleanup_save=2\nentity_encoding=raw\nlang_mode=0\nlang_code=en\ntext_direction=ltr\ncontent_css=1\ncontent_css_custom=\nrelative_urls=1\nnewlines=0\ninvalid_elements=applet\nextended_elements=\ntoolbar=top\ntoolbar_align=left\nhtml_height=550\nhtml_width=750\nelement_path=1\nfonts=1\npaste=1\nsearchreplace=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\ncolors=1\ntable=1\nsmilies=1\nmedia=1\nhr=1\ndirectionality=1\nfullscreen=1\nstyle=1\nlayer=1\nxhtmlxtras=1\nvisualchars=1\nnonbreaking=1\ntemplate=0\nadvimage=1\nadvlink=1\nautosave=1\ncontextmenu=1\ninlinepopups=1\nsafari=1\ncustom_plugin=\ncustom_button=\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 0, 1, 0, 62, '2011-10-28 11:46:05', ''),
(21, 'Editor Button - Image', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Button - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Button - Readmore', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 62, '2011-10-28 11:46:44', ''),
(28, 'System - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Legacy', 'legacy', 'system', 0, 3, 0, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'System - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Remember Me', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(34, 'System - Mootools Upgrade', 'mtupgrade', 'system', 0, 8, 0, 1, 0, 62, '2011-10-28 11:47:11', ''),
(35, 'Content - CAPTCHA', 'captcha', 'content', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'captcha_systems=securImage2\n@group= \ncaptcha_systems-recaptcha-Theme=red\ncaptcha_systems-recaptcha-Lang=en\ncaptcha_systems-securImage2-reloadbutton=1\ncaptcha_systems-securImage2-reloadimage=sync.png\ncaptcha_systems-securImage2-width=140\ncaptcha_systems-securImage2-height=60\ncaptcha_systems-securImage2-length=4\ncaptcha_systems-securImage2-perturbation=0.7\ncaptcha_systems-securImage2-text_color=3D3D3D\ncaptcha_systems-securImage2-number_lines=8\ncaptcha_systems-securImage2-line_color=7C7C7C\ncaptcha_systems-securImage2-signature_color=FFFFFF\ncaptcha_systems-securImage2-bg_color=FFFFFF\ncaptcha_systems-mollom-CaptchaType=both\n'),
(36, 'System - Add Keywords', 'addkeywords', 'system', 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 'dokeys=1\nusetitle=1\nlengthofword=3\nkeycount=20\nblacklist=a, about, above, across, after, afterwards, again, against, all, almost, alone, along, already, also, although, always, am, among, amongst, amoungst, amount, an, and, another, any, anyhow, anyone, anything, anyway, anywhere, are, around, as, at, back, be, became, because, become, becomes, becoming, been, before, beforehand, behind, being, below, beside, besides, between, beyond, bill, both, bottom, but, by, call, can, cannot, cant, co, computer, con, could, couldnt, cry, de, describe, detail, dis, do, done, down, due, during, each, eg, eight, either, eleven, else, elsewhere, empty, enough, etc, even, ever, every, everyone, everything, everywhere, except, few, fifteen, fify, fill, find, fire, first, five, for, former, formerly, forty, found, four, from, front, full, further, get, give, go, had, has, hasnt, have, he, hence, her, here, hereafter, hereby, herein, hereupon, hers, herself, him, himself, his, how, however, http, hundred, i, ie, if, in, inc, indeed, interest, into, is, it, its, itself, keep, last, latter, latterly, least, less, ltd, made, many, may, me, meanwhile, might, mill, mine, more, moreover, most, mostly, move, much, must, my, myself, name, namely, neither, never, nevertheless, next, nine, no, nobody, none, noone, nor, not, nothing, now, nowhere, of, off, often, on, once, one, only, onto, or, org, other, others, otherwise, our, ours, ourselves, out, over, own, part, per, perhaps, please, put, rather, re, same, see, seem, seemed, seeming, seems, serious, several, she, should, show, side, since, sincere, six, sixty, so, some, somehow, someone, something, sometime, sometimes, somewhere, still, such, system, take, ten, than, that, the, their, them, themselves, then, thence, there, thereafter, thereby, therefore, therein, thereupon, these, they, thick, thin, third, this, those, though, three, through, throughout, thru, thus, to, together, too, top, toward, towards, twelve, twenty, two, un, under, until, up, upon, us, very, via, was, we, well, were, what, whatever, when, whence, whenever, where, whereafter, whereas, whereby, wherein, whereupon, wherever, whether, which, while, whither, who, whoever, whole, whom, whose, why, will, with, within, without, would, www, yet, you, your, yours, yourself, yourselves, s, say, said, says, the\nwhitewordweighting=5\nmultiwordweighting=5\ndodesc=1\ndescprimary=sentence\ndescsentcount=2\ndescwordcount=20\ndesccharcount=150\ndotdotdot=1\ntags=1\nnumtags=10\nfronttag=1\nblogtag=1\ntagfieldset=1\ntagtitle=Tags\nsearchtype=exact\nulstyle=margin:0;padding:0;\nlistyle=display:inline;list-style-type:none;padding: 0 0.5em;\naddtagusers=25\nmodfieldset=1\nmodtitle=Related Articles\nmodname=ak_related\nmodstyle=none\ntitlesep=|\ntitlepos=1\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_polls`
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_polls`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_data`
--

CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_poll_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_date`
--

CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_poll_date`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_menu`
--

CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_poll_menu`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_sections`
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`),
  KEY `idx_scope` (`scope`)
<<<<<<< HEAD
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;
=======
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;
>>>>>>> d819b72db841e7915fedb0205f79fe034e105b97

--
-- Dumping data for table `jos_sections`
--

INSERT INTO `jos_sections` (`id`, `title`, `name`, `alias`, `image`, `scope`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `count`, `params`, `status`) VALUES
<<<<<<< HEAD
(1, 'Uncategorized', '', 'uncategorized', '', 'content', 'right', '<p>Uncategorized</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '', 'SY'),
=======
(1, 'Uncategorized', '', 'uncategorized', '', 'content', 'right', '<p>Uncategorized</p>', 1, 62, '2011-10-29 11:00:21', 2, 0, 0, '', 'SY'),
>>>>>>> d819b72db841e7915fedb0205f79fe034e105b97
(2, 'Stocks', '', 'stocks', '', 'content', 'right', '<p>Stocks</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '', 'SY'),
(3, 'Mutual Funds', '', 'mutual Funds', '', 'content', 'right', '<p>Mutual Funds</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '', 'SY'),
(4, 'ETFs', '', 'ETFs', '', 'content', 'right', '<p>ETFs</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '', 'SY'),
(5, 'IPO', '', 'IPO', '', 'content', 'right', '<p>IPO</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '', 'SY'),
(6, 'Gold & Silver', '', 'Gold & Silver', '', 'content', 'right', '<p>Gold & Silver</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '', 'SY'),
(7, 'Futures & Options', '', 'Futures & Options', '', 'content', 'right', '<p>Futures & Options</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '', 'SY'),
(8, 'Forex', '', 'Forex', '', 'content', 'right', '<p>Forex</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '', 'SY'),
(9, 'Commodities', '', 'Commodities', '', 'content', 'right', '<p>Commodities</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '', 'SY'),
(10, 'Global Trends', '', 'Global Trends', '', 'content', 'right', '<p>Global Trends</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '', 'SY'),
(11, 'Investment Basics', '', 'Investment Basics', '', 'content', 'right', '<p>Investment Basics</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '', 'SY'),
(12, 'Technical Analysis', '', 'Technical Analysis', '', 'content', 'right', '<p>Technical Analysis</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '', 'SY'),
<<<<<<< HEAD
(13, 'Fundamental Analysis', '', 'Fundamental Analysis', '', 'content', 'right', '<p>Fundamental Analysis</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '', 'SY');
=======
(13, 'Fundamental Analysis', '', 'Fundamental Analysis', '', 'content', 'right', '<p>Fundamental Analysis</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '', 'SY'),
>>>>>>> d819b72db841e7915fedb0205f79fe034e105b97

-- --------------------------------------------------------

--
-- Table structure for table `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `usertype` varchar(50) DEFAULT '',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('', '1319880995', '780cd7ead2e5897b305bfc5883f814c2', 1, 0, '', 0, 1, '__default|a:8:{s:15:"session.counter";i:1;s:19:"session.timer.start";i:1319880990;s:18:"session.timer.last";i:1319880990;s:17:"session.timer.now";i:1319880990;s:22:"session.client.browser";s:67:"Mozilla/5.0 (Windows NT 5.1; rv:7.0.1) Gecko/20100101 Firefox/7.0.1";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:73:"D:\\xampp\\htdocs\\We-Share-Articles\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"8dca236d8e19072db60c65a3e2d6bb74";}'),
('admin', '1319881040', 'bd681b58cd76586ecc58d404e8a30f2b', 0, 62, 'Super Administrator', 25, 1, '__default|a:8:{s:15:"session.counter";i:9;s:19:"session.timer.start";i:1319880990;s:18:"session.timer.last";i:1319881036;s:17:"session.timer.now";i:1319881040;s:22:"session.client.browser";s:67:"Mozilla/5.0 (Windows NT 5.1; rv:7.0.1) Gecko/20100101 Firefox/7.0.1";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:3:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:0:"";}}s:10:"com_cpanel";a:1:{s:4:"data";O:8:"stdClass":1:{s:9:"mtupgrade";O:8:"stdClass":1:{s:7:"checked";b:1;}}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";s:2:"62";s:4:"name";s:13:"Administrator";s:8:"username";s:5:"admin";s:5:"email";s:25:"admin@wesharearticles.com";s:8:"password";s:65:"cd17f4d39c0e8822b20a084f613349c9:JwwytvmDw2Y1VtFx5jgo3oJPM9C7N03H";s:14:"password_clear";s:0:"";s:8:"usertype";s:19:"Super Administrator";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:3:"gid";s:2:"25";s:12:"registerDate";s:19:"2011-10-08 10:40:04";s:13:"lastvisitDate";s:19:"2011-10-29 07:29:55";s:10:"activation";s:0:"";s:6:"params";s:0:"";s:3:"aid";i:2;s:5:"guest";i:0;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:73:"D:\\xampp\\htdocs\\We-Share-Articles\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"8dca236d8e19072db60c65a3e2d6bb74";}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_stats_agents`
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_stats_agents`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_subscribed_section`
--

CREATE TABLE IF NOT EXISTS `jos_subscribed_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viewer_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `viewer_id` (`viewer_id`,`section_id`),
  KEY `section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_subscribed_section`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_tags`
--

CREATE TABLE IF NOT EXISTS `jos_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagname` (`tagname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `jos_tags`
--

INSERT INTO `jos_tags` (`id`, `tagname`) VALUES
(12, ''),
(40, '111'),
(49, 'a'),
(43, 'aaaa'),
(13, 'ascac'),
(59, 'axax'),
(25, 'axxxa'),
(50, 'bdfdb'),
(29, 'cdscvds'),
(7, 'cqascdsv'),
(47, 'cs'),
(36, 'dsgfdf df hdgf  dfhdf fd h'),
(8, 'fdfdsfdsf, ascacfdas, dsgdfgrfeg, avdsfdcf'),
(37, 'hfdfh dfh'),
(10, 'hi, dear'),
(53, 'n'),
(3, 'naren'),
(42, 'naren,f'),
(9, 'narendran, karthikeyan'),
(34, 'sdf zsdregf dzfvg'),
(52, 'ss'),
(1, 'tag1'),
(2, 'tag2'),
(11, 'vvdv'),
(28, 'vvv'),
(14, 'vvvv'),
(30, 'WQDWQ,QWDQDWQW'),
(6, 'XCASCas'),
(48, 'xcc'),
(56, 'xd'),
(32, 'XGGDF DFSG'),
(45, 'xzc'),
(58, 'z');

-- --------------------------------------------------------

--
-- Table structure for table `jos_templates_menu`
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('rhuk_milkyway', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_users`
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `biography` blob NOT NULL,
  `website` varchar(255) NOT NULL,
  `isfeatured` tinyint(2) NOT NULL DEFAULT '0',
  `isNewsletterSubscribed` tinyint(2) NOT NULL DEFAULT '0',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `image`, `biography`, `website`, `isfeatured`, `isNewsletterSubscribed`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'admin@wesharearticles.com', 'cd17f4d39c0e8822b20a084f613349c9:JwwytvmDw2Y1VtFx5jgo3oJPM9C7N03H', 'Super Administrator', 0, 1, '', '', '', 0, 0, 25, '2011-10-08 10:40:04', '2011-10-29 09:36:35', '', ''),
(63, 'naren', 'author', 'mailfornarens@gmail.com', '767b98cfdea816889587b142e1a258a3:bYt8APjzNNWuOh7vuPNdbfjCRxfgikiC', 'Author', 0, 0, '', '', '', 0, 0, 19, '2011-10-08 11:26:40', '0000-00-00 00:00:00', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(64, 'dhanapal', 'dhanapal', 'dhanapal.hideaz@gmail.com', '392b3f747085fedd7c88910d094f2a14:ez7IdczsiZDD6e537bulXzf8PxLYYLqb', 'Author', 0, 0, '', '', '', 0, 0, 19, '2011-10-11 17:48:16', '0000-00-00 00:00:00', '525e79bc65348ae95c2309320a99521a:$1$2e8076c2$', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(65, 'dhanapal', 'dhanapal p', 'dhana281188@gmail.com', '0e4f24bc69f15138c3126c70a4ced675:HnNO1cS6gqCegdTNXFj4KTVs71PGaFCy', 'Author', 0, 1, '', '', '', 0, 0, 19, '2011-10-12 14:21:54', '0000-00-00 00:00:00', '8cabda7bb25f1f79456106eebebedc1c', 'language=\ntimezone=0\neditor=\nhelpsite=\n\n'),
(66, 'Maries', 'maries', 'maries.hideaz@gmail.com', 'd71c3c5d8f184d794bc0111b5768111f:cF9biJq8eOnhbN9eT9izrsMlpcmm3c7E', 'Author', 0, 1, '', '', '', 0, 0, 19, '2011-10-17 04:26:07', '0000-00-00 00:00:00', '', 'admin_language=en-GB\nlanguage=en-GB\neditor=\nhelpsite=\ntimezone=5.5\n\n'),
(67, 'fddfdf', 'dfdf123', 'm@ymail.com', '091336a3cc8e9aeb91fb238ecbae8195:RdflJeauisdkUYT27QfOf8Grgv5p1gXp', 'Registered', 1, 0, '', '', '', 0, 0, 18, '2011-10-19 08:42:23', '0000-00-00 00:00:00', 'd683f0c38c9151bbc0d374afac726678', '\n'),
(68, 'Maries', 'maries284', 'maries_284@yahoo.com', '15ba9a968cb9fff7c7fd8d1f153898b6:nBgKznVYJD8hcN52Q3U1iIxr2FsNawFX', 'Registered', 1, 0, '', '', '', 0, 0, 18, '2011-10-19 09:40:09', '0000-00-00 00:00:00', '52984ca7ff9043cdadec2da44873bfb1', '\n'),
(69, 'Maries', 'maries.varan', 'maries.varan@yahoo.com', 'dcc1201d8b3f415efcc2febc5807343e:iZXSkNs4qWdqEUXnqxFluYdO5NsDZQgO', 'Registered', 1, 0, '', '', '', 0, 0, 18, '2011-10-19 09:43:24', '0000-00-00 00:00:00', 'ff9a773e87276edad5ec05344bf88fd6', '\n'),
(70, 'Magedgg', 'ffjdjf', 'ffjdjf@gmail.com', 'd90bf10ae4c3cdf93950f93a863e5d56:NrKKfdSgS72nRPZB7kD63qqst5UqJIFT', 'Registered', 1, 0, '', '', '', 0, 0, 18, '2011-10-19 09:48:06', '0000-00-00 00:00:00', '6ee2c3fa71ccc5266cf5593b20c5ffca', '\n'),
(71, 'mmmmm', 'mmmmm', 'mmmmm@ymail.com', '0fbb0a94715cd8eb9698edb33d925b00:V3waoXaEcb8D6gFzyhZJPVUaSUONqeSH', 'Registered', 1, 0, '', '', '', 0, 0, 18, '2011-10-20 04:45:48', '0000-00-00 00:00:00', '967f1f438f61e127fbd06dd7fe0054b9', '\n'),
(72, '', '', 'vcvcv', '9c985766eb3614d646770b559f811ee3:phZXjKoIonZ935hrhkZHj8xyOa63ktlw', 'Registered', 1, 0, '', '', '', 0, 0, 18, '2011-10-20 10:04:44', '0000-00-00 00:00:00', 'd4d11f553b211e03f1b5241a3bae6044', '\n'),
(73, '', '', 'rtrt', 'd25de64f639978e87f6782f4a841f80b:tJiejaVDgpRONVwYftEE5h077yJQAsAl', 'Registered', 1, 0, '', '', '', 0, 0, 18, '2011-10-20 10:05:15', '0000-00-00 00:00:00', '04d81b7f05d47279476159a5ef26084b', '\n'),
(74, 'Naren', 'narens', 'naren.hideaz@gmail.com', '25219d606dbe1cbc4ad27c5c02e3eeac:6VTm9ZWSkr8sTANRgxSLeQlhoBpd8kV5', 'Registered', 1, 0, '', '', '', 0, 0, 18, '2011-10-29 05:44:21', '0000-00-00 00:00:00', 'b626605edd0aa11a55c351f64a289cd6', '\n'),
(75, 'NARENNNNNN', 'NARENNNNNN', 'NARENNNNNN@gmail.com', '0ad728839374ab59b23db6c544090913:pQhmQqzGiHJzSDOB9Cu2b5j7f8CN7RaR', 'Registered', 1, 0, '', '', '', 0, 0, 18, '2011-10-29 06:45:16', '0000-00-00 00:00:00', '9262dbe698ef5f6bd724ca461cb82d90', '\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_weblinks`
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_weblinks`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `jos_articles_liked`
--
ALTER TABLE `jos_articles_liked`
  ADD CONSTRAINT `jos_articles_liked_ibfk_1` FOREIGN KEY (`viewer_id`) REFERENCES `jos_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `jos_articles_liked_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `jos_content` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jos_articles_ratings`
--
ALTER TABLE `jos_articles_ratings`
  ADD CONSTRAINT `jos_articles_ratings_ibfk_1` FOREIGN KEY (`viewer_id`) REFERENCES `jos_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `jos_articles_ratings_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `jos_content` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jos_article_comments`
--
ALTER TABLE `jos_article_comments`
  ADD CONSTRAINT `jos_article_comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `jos_content` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jos_article_read`
--
ALTER TABLE `jos_article_read`
  ADD CONSTRAINT `jos_article_read_ibfk_1` FOREIGN KEY (`viewer_id`) REFERENCES `jos_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `jos_article_read_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `jos_content` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jos_article_section`
--
ALTER TABLE `jos_article_section`
  ADD CONSTRAINT `jos_article_section_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `jos_content` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `jos_article_section_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `jos_sections` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jos_article_tags`
--
ALTER TABLE `jos_article_tags`
  ADD CONSTRAINT `jos_article_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `jos_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `jos_article_tags_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `jos_content` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jos_author_articles`
--
ALTER TABLE `jos_author_articles`
  ADD CONSTRAINT `jos_author_articles_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `jos_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `jos_author_articles_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `jos_content` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jos_author_rating`
--
ALTER TABLE `jos_author_rating`
  ADD CONSTRAINT `jos_author_rating_ibfk_1` FOREIGN KEY (`viewer_id`) REFERENCES `jos_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `jos_author_rating_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `jos_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jos_subscribed_section`
--
ALTER TABLE `jos_subscribed_section`
  ADD CONSTRAINT `jos_subscribed_section_ibfk_1` FOREIGN KEY (`viewer_id`) REFERENCES `jos_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `jos_subscribed_section_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `jos_sections` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
