-- MySQL dump 10.13  Distrib 5.1.52, for redhat-linux-gnu (x86_64)
--
-- Host: 127.1.22.1    Database: 
-- ------------------------------------------------------
-- Server version	5.1.52

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


--
-- Current Database: `wolfcms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `wolfcms` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `wolfcms`;

--
-- Table structure for table `cron`
--

DROP TABLE IF EXISTS `cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lastrun` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron`
--

LOCK TABLES `cron` WRITE;
/*!40000 ALTER TABLE `cron` DISABLE KEYS */;
INSERT INTO `cron` VALUES (1,'0');
/*!40000 ALTER TABLE `cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout`
--

DROP TABLE IF EXISTS `layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `content_type` varchar(80) DEFAULT NULL,
  `content` text,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `position` mediumint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout`
--

LOCK TABLES `layout` WRITE;
/*!40000 ALTER TABLE `layout` DISABLE KEYS */;
INSERT INTO `layout` VALUES (1,'none','text/html','<?php echo $this->content(); ?>','2011-08-29 21:07:40','2011-08-29 21:07:41',1,1,NULL),(2,'Wolf','text/html','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en-GB\">\r\n\r\n<head>\r\n	<title><?php echo $this->title(); ?></title>\r\n\r\n  <meta http-equiv=\"content-type\" content=\"application/xhtml+xml; charset=utf-8\" />\r\n  <meta name=\"robots\" content=\"index, follow\" />\r\n  <meta name=\"description\" content=\"<?php echo ($this->description() != \'\') ? $this->description() : \'Default description goes here\'; ?>\" />\r\n  <meta name=\"keywords\" content=\"<?php echo ($this->keywords() != \'\') ? $this->keywords() : \'default, keywords, here\'; ?>\" />\r\n  <meta name=\"author\" content=\"Author Name\" />\r\n\r\n  <link rel=\"favourites icon\" href=\"<?php echo THEMES_URI; ?>simple/images/favicon.ico\" />\r\n\r\n  <!-- Adapted from Matthew James Taylor\'s \"Holy Grail 3 column liquid-layout\" = http://bit.ly/ejfjq -->\r\n  <!-- No snippets used; but snippet blocks for header, secondary nav, and footer are indicated -->\r\n\r\n  <link rel=\"stylesheet\" href=\"<?php echo THEMES_URI; ?>wolf/screen.css\" media=\"screen\" type=\"text/css\" />\r\n  <link rel=\"stylesheet\" href=\"<?php echo THEMES_URI; ?>wolf/print.css\" media=\"print\" type=\"text/css\" />\r\n  <link rel=\"alternate\" type=\"application/rss+xml\" title=\"Wolf Default RSS Feed\" href=\"<?php echo URL_PUBLIC.((USE_MOD_REWRITE)?\'\':\'/?\'); ?>rss.xml\" />\r\n\r\n</head>\r\n<body>\r\n\r\n<!-- HEADER - COULD BE SNIPPET / START -->\r\n<div id=\"header\">\r\n	<h1><a href=\"<?php echo URL_PUBLIC; ?>\">Wolf</a><span class=\"tagline\">content management simplified</span></h1>\r\n</div><!-- / #header -->\r\n<div id=\"nav\">\r\n	<ul>\r\n      <li><a<?php echo url_match(\'/\') ? \' class=\"current\"\': \'\'; ?> href=\"<?php echo URL_PUBLIC; ?>\">Home</a></li>\r\n<?php foreach($this->find(\'/\')->children() as $menu): ?>\r\n      <li><?php echo $menu->link($menu->title, (in_array($menu->slug, explode(\'/\', $this->url)) ? \' class=\"current\"\': null)); ?></li>\r\n<?php endforeach; ?> \r\n	</ul>\r\n</div><!-- / #nav -->\r\n<!-- HEADER / END -->\r\n\r\n<div id=\"colmask\"><div id=\"colmid\"><div id=\"colright\"><!-- = outer nested divs -->\r\n\r\n	<div id=\"col1wrap\"><div id=\"col1pad\"><!-- = inner/col1 nested divs -->\r\n\r\n		<div id=\"col1\">\r\n		<!-- Column 1 start = main content -->\r\n\r\n<h2><?php echo $this->title(); ?></h2>\r\n\r\n  <?php echo $this->content(); ?> \r\n  <?php if ($this->hasContent(\'extended\')) echo $this->content(\'extended\'); ?> \r\n\r\n		<!-- Column 1 end -->\r\n		</div><!-- / #col1 -->\r\n	\r\n	<!-- end inner/col1 nested divs -->\r\n	</div><!-- / #col1pad --></div><!-- / #col1wrap -->\r\n\r\n		<div id=\"col2\">\r\n		<!-- Column 2 start = left/running sidebar -->\r\n\r\n  <?php echo $this->content(\'sidebar\', true); ?> \r\n\r\n		<!-- Column 2 end -->\r\n		</div><!-- / #col2 -->\r\n\r\n		<div id=\"col3\">\r\n		<!-- Column 3 start = right/secondary nav sidebar -->\r\n\r\n<!-- THIS CONDITIONAL NAVIGATION COULD GO INTO A SNIPPET / START -->\r\n<?php if ($this->level() > 0) { $parent = reset(explode(\'/\', CURRENT_URI)); $topPage = $this->find($parent); } ?>\r\n<?php if(isset($topPage) && $topPage != \'\' && $topPage != null) : ?>\r\n\r\n<?php if ($this->level() > 0) : ?>\r\n<?php if (count($topPage->children()) > 0 && $topPage->slug() != \'articles\') : ?>\r\n<h2><?php echo $topPage->title(); ?> Menu</h2>\r\n<ul>\r\n<?php foreach ($topPage->children() as $subPage): ?>\r\n    <li><?php echo $subPage->link($subPage->title, (url_start_with($subPage->url) ? \' class=\"current\"\': null)); ?></li>\r\n<?php endforeach; ?>\r\n</ul>\r\n<?php endif; ?>\r\n<?php endif; ?>\r\n<?php endif; ?>\r\n<!-- CONDITIONAL NAVIGATION / END -->\r\n\r\n		<!-- Column 3 end -->\r\n		</div><!-- / #col3 -->\r\n\r\n<!-- end outer nested divs -->\r\n</div><!-- / #colright --></div><!-- /colmid # --></div><!-- / #colmask -->\r\n\r\n<!-- FOOTER - COULD BE SNIPPET / START -->\r\n<div id=\"footer\">\r\n\r\n  <p>&copy; Copyright <?php echo date(\'Y\'); ?> <a href=\"http://www.wolfcms.org/\" title=\"Wolf\">Your name</a><br />\r\n  <a href=\"http://www.wolfcms.org/\" title=\"Wolf CMS\">Wolf CMS</a> Inside.\r\n  </p>\r\n  \r\n</div><!-- / #footer -->\r\n<!-- FOOTER / END -->\r\n\r\n</body>\r\n</html>','2011-08-29 21:07:42','2011-08-29 21:07:43',1,1,NULL),(3,'Simple','text/html','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\r\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n  <title><?php echo $this->title(); ?></title>\r\n\r\n  <meta http-equiv=\"content-type\" content=\"application/xhtml+xml; charset=utf-8\" />\r\n  <meta name=\"robots\" content=\"index, follow\" />\r\n  <meta name=\"description\" content=\"<?php echo ($this->description() != \'\') ? $this->description() : \'Default description goes here\'; ?>\" />\r\n  <meta name=\"keywords\" content=\"<?php echo ($this->keywords() != \'\') ? $this->keywords() : \'default, keywords, here\'; ?>\" />\r\n  <meta name=\"author\" content=\"Author Name\" />\r\n\r\n  <link rel=\"favourites icon\" href=\"<?php echo THEMES_URI; ?>wolf/images/favicon.ico\" />\r\n    <link rel=\"stylesheet\" href=\"<?php echo THEMES_URI; ?>simple/screen.css\" media=\"screen\" type=\"text/css\" />\r\n    <link rel=\"stylesheet\" href=\"<?php echo THEMES_URI; ?>simple/print.css\" media=\"print\" type=\"text/css\" />\r\n    <link rel=\"alternate\" type=\"application/rss+xml\" title=\"Wolf Default RSS Feed\" href=\"<?php echo URL_PUBLIC.((USE_MOD_REWRITE)?\'\':\'/?\'); ?>rss.xml\" />\r\n\r\n</head>\r\n<body>\r\n<div id=\"page\">\r\n<?php $this->includeSnippet(\'header\'); ?>\r\n<div id=\"content\">\r\n\r\n  <h2><?php echo $this->title(); ?></h2>\r\n  <?php echo $this->content(); ?> \r\n  <?php if ($this->hasContent(\'extended\')) echo $this->content(\'extended\'); ?> \r\n\r\n</div> <!-- end #content -->\r\n<div id=\"sidebar\">\r\n\r\n  <?php echo $this->content(\'sidebar\', true); ?> \r\n\r\n</div> <!-- end #sidebar -->\r\n<?php $this->includeSnippet(\'footer\'); ?>\r\n</div> <!-- end #page -->\r\n</body>\r\n</html>','2011-08-29 21:07:44','2011-08-29 21:07:45',1,1,NULL),(4,'RSS XML','application/rss+xml','<?php echo $this->content(); ?>','2011-08-29 21:07:46','2011-08-29 21:07:47',1,1,NULL);
/*!40000 ALTER TABLE `layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(100) NOT NULL DEFAULT '',
  `breadcrumb` varchar(160) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` text,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `layout_id` int(11) unsigned DEFAULT NULL,
  `behavior_id` varchar(25) NOT NULL DEFAULT '',
  `status_id` int(11) unsigned NOT NULL DEFAULT '100',
  `created_on` datetime DEFAULT NULL,
  `published_on` datetime DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `position` mediumint(6) unsigned DEFAULT '0',
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `needs_login` tinyint(1) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'Home Page','','Home Page',NULL,NULL,0,2,'',100,'2011-08-29 21:07:48','2011-08-29 21:07:49',NULL,'2011-08-29 21:07:50',1,1,0,1,0),(2,'RSS Feed','rss.xml','RSS Feed',NULL,NULL,1,4,'',101,'2011-08-29 21:07:51','2011-08-29 21:07:52',NULL,'2011-08-29 21:07:53',1,1,2,1,0),(3,'About us','about-us','About us',NULL,NULL,1,0,'',100,'2011-08-29 21:07:54','2011-08-29 21:07:55',NULL,'2011-08-29 21:07:56',1,1,0,0,2),(4,'Articles','articles','Articles',NULL,NULL,1,0,'archive',100,'2011-08-29 21:07:57','2011-08-29 21:07:58',NULL,'2011-08-29 21:07:59',1,1,1,1,2),(5,'My first article','my-first-article','My first article',NULL,NULL,4,0,'',100,'2011-08-29 21:08:00','2011-08-29 21:08:01',NULL,'2011-08-29 21:08:02',1,1,0,0,2),(6,'My second article','my-second-article','My second article',NULL,NULL,4,0,'',100,'2011-08-29 21:08:03','2011-08-29 21:08:04',NULL,'2011-08-29 21:08:05',1,1,0,0,2),(7,'%B %Y archive','monthly-archive','%B %Y archive',NULL,NULL,4,0,'archive_month_index',101,'2011-08-29 21:08:06','2011-08-29 21:08:07',NULL,'2011-08-29 21:08:08',1,1,0,1,2);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_part`
--

DROP TABLE IF EXISTS `page_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_part` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `filter_id` varchar(25) DEFAULT NULL,
  `content` longtext,
  `content_html` longtext,
  `page_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_part`
--

LOCK TABLES `page_part` WRITE;
/*!40000 ALTER TABLE `page_part` DISABLE KEYS */;
INSERT INTO `page_part` VALUES (1,'body','','<?php \r\n\r\n$page_article = $this->find(\'/articles/\');\r\n\r\nif ($page_article->childrenCount() > 0) {\r\n    $last_article = $page_article->children(array(\'limit\'=>1, \'order\'=>\'page.created_on DESC\'));\r\n    $last_articles = $page_article->children(array(\'limit\'=>4, \'offset\' => 1, \'order\'=>\'page.created_on DESC\'));\r\n?>\r\n<div class=\"first entry\">\r\n  <h3><?php echo $last_article->link(); ?></h3>\r\n  <?php echo $last_article->content(); ?>\r\n  <?php if ($last_article->hasContent(\'extended\')) echo $last_article->link(\'Continue Reading&#8230;\'); ?>\r\n  <p class=\"info\">Posted by <?php echo $last_article->author(); ?> on <?php echo $last_article->date(); ?></p>\r\n</div>\r\n\r\n<?php foreach ($last_articles as $article): ?>\r\n<div class=\"entry\">\r\n  <h3><?php echo $article->link(); ?></h3>\r\n  <?php echo $article->content(); ?>\r\n  <?php if ($article->hasContent(\'extended\')) echo $article->link(\'Continue Reading&#8230;\'); ?>\r\n  <p class=\"info\">Posted by <?php echo $article->author(); ?> on <?php echo $article->date(); ?></p>\r\n</div>\r\n\r\n<?php\r\n    endforeach; \r\n}\r\n?>','<?php \r\n\r\n$page_article = $this->find(\'/articles/\');\r\n\r\nif ($page_article->childrenCount() > 0) {\r\n    $last_article = $page_article->children(array(\'limit\'=>1, \'order\'=>\'page.created_on DESC\'));\r\n    $last_articles = $page_article->children(array(\'limit\'=>4, \'offset\' => 1, \'order\'=>\'page.created_on DESC\'));\r\n?>\r\n<div class=\"first entry\">\r\n  <h3><?php echo $last_article->link(); ?></h3>\r\n  <?php echo $last_article->content(); ?>\r\n  <?php if ($last_article->hasContent(\'extended\')) echo $last_article->link(\'Continue Reading&#8230;\'); ?>\r\n  <p class=\"info\">Posted by <?php echo $last_article->author(); ?> on <?php echo $last_article->date(); ?></p>\r\n</div>\r\n\r\n<?php foreach ($last_articles as $article): ?>\r\n<div class=\"entry\">\r\n  <h3><?php echo $article->link(); ?></h3>\r\n  <?php echo $article->content(); ?>\r\n  <?php if ($article->hasContent(\'extended\')) echo $article->link(\'Continue Reading&#8230;\'); ?>\r\n  <p class=\"info\">Posted by <?php echo $article->author(); ?> on <?php echo $article->date(); ?></p>\r\n</div>\r\n\r\n<?php\r\n    endforeach; \r\n}\r\n?>',1),(2,'body','','<?php echo \'<?\'; ?>xml version=\"1.0\" encoding=\"UTF-8\"<?php echo \'?>\'; ?> \r\n<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\r\n<channel>\r\n	<title>Wolf CMS</title>\r\n	<link><?php echo BASE_URL ?></link>\r\n	<atom:link href=\"<?php echo BASE_URL ?>rss.xml\" rel=\"self\" type=\"application/rss+xml\" />\r\n	<language>en-us</language>\r\n	<copyright>Copyright <?php echo date(\'Y\'); ?>, wolfcms.org</copyright>\r\n	<pubDate><?php echo strftime(\'%a, %d %b %Y %H:%M:%S %z\'); ?></pubDate>\r\n	<lastBuildDate><?php echo strftime(\'%a, %d %b %Y %H:%M:%S %z\'); ?></lastBuildDate>\r\n	<category>any</category>\r\n	<generator>Wolf CMS</generator>\r\n	<description>The main news feed from Wolf CMS.</description>\r\n	<docs>http://www.rssboard.org/rss-specification</docs>\r\n	<?php $articles = $this->find(\'articles\'); ?>\r\n	<?php foreach ($articles->children(array(\'limit\' => 10, \'order\' => \'page.created_on DESC\')) as $article): ?>\r\n	<item>\r\n		<title><?php echo $article->title(); ?></title>\r\n		<description><?php if ($article->hasContent(\'summary\')) { echo $article->content(\'summary\'); } else { echo strip_tags($article->content()); } ?></description>\r\n		<pubDate><?php echo $article->date(\'%a, %d %b %Y %H:%M:%S %z\'); ?></pubDate>\r\n		<link><?php echo $article->url(); ?></link>\r\n		<guid><?php echo $article->url(); ?></guid>\r\n	</item>\r\n	<?php endforeach; ?>\r\n</channel>\r\n</rss>','<?php echo \'<?\'; ?>xml version=\"1.0\" encoding=\"UTF-8\"<?php echo \'?>\'; ?> \r\n<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\r\n<channel>\r\n	<title>Wolf CMS</title>\r\n	<link><?php echo BASE_URL ?></link>\r\n	<atom:link href=\"<?php echo BASE_URL ?>rss.xml\" rel=\"self\" type=\"application/rss+xml\" />\r\n	<language>en-us</language>\r\n	<copyright>Copyright <?php echo date(\'Y\'); ?>, wolfcms.org</copyright>\r\n	<pubDate><?php echo strftime(\'%a, %d %b %Y %H:%M:%S %z\'); ?></pubDate>\r\n	<lastBuildDate><?php echo strftime(\'%a, %d %b %Y %H:%M:%S %z\'); ?></lastBuildDate>\r\n	<category>any</category>\r\n	<generator>Wolf CMS</generator>\r\n	<description>The main news feed from Wolf CMS.</description>\r\n	<docs>http://www.rssboard.org/rss-specification</docs>\r\n	<?php $articles = $this->find(\'articles\'); ?>\r\n	<?php foreach ($articles->children(array(\'limit\' => 10, \'order\' => \'page.created_on DESC\')) as $article): ?>\r\n	<item>\r\n		<title><?php echo $article->title(); ?></title>\r\n		<description><?php if ($article->hasContent(\'summary\')) { echo $article->content(\'summary\'); } else { echo strip_tags($article->content()); } ?></description>\r\n		<pubDate><?php echo $article->date(\'%a, %d %b %Y %H:%M:%S %z\'); ?></pubDate>\r\n		<link><?php echo $article->url(); ?></link>\r\n		<guid><?php echo $article->url(); ?></guid>\r\n	</item>\r\n	<?php endforeach; ?>\r\n</channel>\r\n</rss>',2),(3,'body','textile','This is my site. I live in this city ... I do some nice things, like this and that ...','<p>This is my site. I live in this city &#8230; I do some nice things, like this and that &#8230;</p>',3),(4,'body','','<?php $last_articles = $this->children(array(\'limit\'=>5, \'order\'=>\'page.created_on DESC\')); ?>\r\n<?php foreach ($last_articles as $article): ?>\r\n<div class=\"entry\">\r\n  <h3><?php echo $article->link($article->title); ?></h3>\r\n  <?php echo $article->content(); ?>\r\n  <p class=\"info\">Posted by <?php echo $article->author(); ?> on <?php echo $article->date(); ?>  \r\n     <br />tags: <?php echo join(\', \', $article->tags()); ?>\r\n  </p>\r\n</div>\r\n<?php endforeach; ?>\r\n\r\n','<?php $last_articles = $this->children(array(\'limit\'=>5, \'order\'=>\'page.created_on DESC\')); ?>\r\n<?php foreach ($last_articles as $article): ?>\r\n<div class=\"entry\">\r\n  <h3><?php echo $article->link($article->title); ?></h3>\r\n  <?php echo $article->content(); ?>\r\n  <p class=\"info\">Posted by <?php echo $article->author(); ?> on <?php echo $article->date(); ?>  \r\n     <br />tags: <?php echo join(\', \', $article->tags()); ?>\r\n  </p>\r\n</div>\r\n<?php endforeach; ?>\r\n\r\n',4),(5,'body','markdown','My **first** test of my first article that uses *Markdown*.','<p>My <strong>first</strong> test of my first article that uses <em>Markdown</em>.</p>\n',5),(7,'body','markdown','This is my second article.','<p>This is my second article.</p>\n',6),(8,'body','','<?php $archives = $this->archive->get(); ?>\r\n<?php foreach ($archives as $archive): ?>\r\n<div class=\"entry\">\r\n  <h3><?php echo $archive->link(); ?></h3>\r\n  <p class=\"info\">Posted by <?php echo $archive->author(); ?> on <?php echo $archive->date(); ?> \r\n  </p>\r\n</div>\r\n<?php endforeach; ?>','<?php $archives = $this->archive->get(); ?>\r\n<?php foreach ($archives as $archive): ?>\r\n<div class=\"entry\">\r\n  <h3><?php echo $archive->link(); ?></h3>\r\n  <p class=\"info\">Posted by <?php echo $archive->author(); ?> on <?php echo $archive->date(); ?> \r\n  </p>\r\n</div>\r\n<?php endforeach; ?>',7),(9,'sidebar','','<h3>About Me</h3>\r\n\r\n<p>I\'m just a demonstration of how easy it is to use Wolf CMS to power a blog. <a href=\"<?php echo BASE_URL; ?>about-us\">more ...</a></p>\r\n\r\n<h3>Favorite Sites</h3>\r\n<ul>\r\n  <li><a href=\"http://www.wolfcms.org\">Wolf CMS</a></li>\r\n</ul>\r\n\r\n<?php if(url_match(\'/\')): ?>\r\n<h3>Recent Entries</h3>\r\n<?php $page_article = $this->find(\'/articles/\'); ?>\r\n<ul>\r\n<?php foreach ($page_article->children(array(\'limit\' => 10, \'order\' => \'page.created_on DESC\')) as $article): ?>\r\n  <li><?php echo $article->link(); ?></li> \r\n<?php endforeach; ?>\r\n</ul>\r\n<?php endif; ?>\r\n\r\n<p><a href=\"<?php echo BASE_URL; ?>articles\">Archives</a></p>\r\n\r\n<h3>Syndicate</h3>\r\n\r\n<p><a href=\"<?php echo BASE_URL; ?>rss.xml\">Articles RSS Feed</a></p>','<h3>About Me</h3>\r\n\r\n<p>I\'m just a demonstration of how easy it is to use Wolf CMS to power a blog. <a href=\"<?php echo BASE_URL; ?>about-us\">more ...</a></p>\r\n\r\n<h3>Favorite Sites</h3>\r\n<ul>\r\n  <li><a href=\"http://www.wolfcms.org\">Wolf CMS</a></li>\r\n</ul>\r\n\r\n<?php if(url_match(\'/\')): ?>\r\n<h3>Recent Entries</h3>\r\n<?php $page_article = $this->find(\'/articles/\'); ?>\r\n<ul>\r\n<?php foreach ($page_article->children(array(\'limit\' => 10, \'order\' => \'page.created_on DESC\')) as $article): ?>\r\n  <li><?php echo $article->link(); ?></li> \r\n<?php endforeach; ?>\r\n</ul>\r\n<?php endif; ?>\r\n\r\n<p><a href=\"<?php echo BASE_URL; ?>articles\">Archives</a></p>\r\n\r\n<h3>Syndicate</h3>\r\n\r\n<p><a href=\"<?php echo BASE_URL; ?>rss.xml\">Articles RSS Feed</a></p>',1),(10,'sidebar','','<?php $article = $this->find(\'articles\'); ?>\r\n<?php $archives = $article->archive->archivesByMonth(); ?>\r\n\r\n<h3>Archives By Month</h3>\r\n<ul>\r\n<?php foreach ($archives as $date): ?>\r\n  <li><a href=\"<?php echo BASE_URL . $this->url .\'/\'. $date . URL_SUFFIX; ?>\"><?php echo strftime(\'%B %Y\', strtotime(strtr($date, \'/\', \'-\'))); ?></a></li>\r\n<?php endforeach; ?>\r\n</ul>','<?php $article = $this->find(\'articles\'); ?>\r\n<?php $archives = $article->archive->archivesByMonth(); ?>\r\n\r\n<h3>Archives By Month</h3>\r\n<ul>\r\n<?php foreach ($archives as $date): ?>\r\n  <li><a href=\"<?php echo BASE_URL . $this->url .\'/\'. $date . URL_SUFFIX; ?>\"><?php echo strftime(\'%B %Y\', strtotime(strtr($date, \'/\', \'-\'))); ?></a></li>\r\n<?php endforeach; ?>\r\n</ul>',4);
/*!40000 ALTER TABLE `page_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_tag`
--

DROP TABLE IF EXISTS `page_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_tag` (
  `page_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) unsigned NOT NULL,
  UNIQUE KEY `page_id` (`page_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_tag`
--

LOCK TABLES `page_tag` WRITE;
/*!40000 ALTER TABLE `page_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'admin_view'),(2,'admin_edit'),(3,'user_view'),(4,'user_add'),(5,'user_edit'),(6,'user_delete'),(7,'layout_view'),(8,'layout_add'),(9,'layout_edit'),(10,'layout_delete'),(11,'snippet_view'),(12,'snippet_add'),(13,'snippet_edit'),(14,'snippet_delete'),(15,'page_view'),(16,'page_add'),(17,'page_edit'),(18,'page_delete'),(19,'file_manager_view'),(20,'file_manager_upload'),(21,'file_manager_mkdir'),(22,'file_manager_mkfile'),(23,'file_manager_rename'),(24,'file_manager_chmod'),(25,'file_manager_delete'),(26,'backup_restore_view');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_settings`
--

DROP TABLE IF EXISTS `plugin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_settings` (
  `plugin_id` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `value` varchar(255) NOT NULL,
  UNIQUE KEY `plugin_setting_id` (`plugin_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES ('archive','use_dates','1'),('file_manager','umask','0022'),('file_manager','dirmode','0755'),('file_manager','filemode','0644'),('file_manager','show_hidden','0'),('file_manager','show_backups','1');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'administrator'),(2,'developer'),(3,'editor');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  UNIQUE KEY `user_id` (`role_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(2,1),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(3,1),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secure_token`
--

DROP TABLE IF EXISTS `secure_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secure_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_url` (`username`,`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secure_token`
--

LOCK TABLES `secure_token` WRITE;
/*!40000 ALTER TABLE `secure_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `secure_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `name` varchar(40) NOT NULL,
  `value` text NOT NULL,
  UNIQUE KEY `id` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES ('admin_title','Wolf CMS'),('admin_email','do-not-reply@wolfcms.org'),('language','en'),('theme','brown_and_green'),('default_status_id','1'),('default_filter_id',''),('default_tab',''),('allow_html_title','off'),('plugins','a:5:{s:7:\"textile\";i:1;s:8:\"markdown\";i:1;s:7:\"archive\";i:1;s:14:\"page_not_found\";i:1;s:12:\"file_manager\";i:1;}');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snippet`
--

DROP TABLE IF EXISTS `snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snippet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `filter_id` varchar(25) DEFAULT NULL,
  `content` text,
  `content_html` text,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `position` mediumint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snippet`
--

LOCK TABLES `snippet` WRITE;
/*!40000 ALTER TABLE `snippet` DISABLE KEYS */;
INSERT INTO `snippet` VALUES (1,'header','','<div id=\"header\">\r\n  <h1><a href=\"<?php echo URL_PUBLIC; ?>\">Wolf</a> <span>content management simplified</span></h1>\r\n  <div id=\"nav\">\r\n    <ul>\r\n      <li><a<?php echo url_match(\'/\') ? \' class=\"current\"\': \'\'; ?> href=\"<?php echo URL_PUBLIC; ?>\">Home</a></li>\r\n<?php foreach($this->find(\'/\')->children() as $menu): ?>\r\n      <li><?php echo $menu->link($menu->title, (in_array($menu->slug, explode(\'/\', $this->url)) ? \' class=\"current\"\': null)); ?></li>\r\n<?php endforeach; ?> \r\n    </ul>\r\n  </div> <!-- end #navigation -->\r\n</div> <!-- end #header -->','<div id=\"header\">\r\n  <h1><a href=\"<?php echo URL_PUBLIC; ?>\">Wolf</a> <span>content management simplified</span></h1>\r\n  <div id=\"nav\">\r\n    <ul>\r\n      <li><a<?php echo url_match(\'/\') ? \' class=\"current\"\': \'\'; ?> href=\"<?php echo URL_PUBLIC; ?>\">Home</a></li>\r\n<?php foreach($this->find(\'/\')->children() as $menu): ?>\r\n      <li><?php echo $menu->link($menu->title, (in_array($menu->slug, explode(\'/\', $this->url)) ? \' class=\"current\"\': null)); ?></li>\r\n<?php endforeach; ?> \r\n    </ul>\r\n  </div> <!-- end #navigation -->\r\n</div> <!-- end #header -->','2011-08-29 21:08:09','2011-08-29 21:08:10',1,1,NULL),(2,'footer','','<div id=\"footer\"><div id=\"footer-inner\">\r\n  <p>&copy; Copyright <?php echo date(\'Y\'); ?> <a href=\"http://www.wolfcms.org/\" title=\"Wolf\">Your Name</a><br />\r\n  <a href=\"http://www.wolfcms.org/\" title=\"Wolf CMS\">Wolf CMS</a> Inside.\r\n  </p>\r\n</div></div><!-- end #footer -->','<div id=\"footer\"><div id=\"footer-inner\">\r\n  <p>&copy; Copyright <?php echo date(\'Y\'); ?> <a href=\"http://www.wolfcms.org/\" alt=\"Wolf\">Your Name</a><br />\r\n  <a href=\"http://www.wolfcms.org/\" alt=\"Wolf\">Wolf CMS</a> Inside.\r\n  </p>\r\n</div></div><!-- end #footer -->','2011-08-29 21:08:11','2011-08-29 21:08:12',1,1,NULL);
/*!40000 ALTER TABLE `snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `count` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(1024) DEFAULT NULL,
  `salt` varchar(1024) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_failure` datetime DEFAULT NULL,
  `failure_count` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Administrator','admin@yoursite.com','admin','c682e6d20d08b5d779c1b57f340e6c954df020a524289cc41c4dea6e15045c018ba26856cef6adf27334e6860590e8994e4b1b1b572d9280b7bd9ce881553fdc','9991c3d4f7946ba752f32f8c42ad6cbe177d8f9894ae2434ae42e34d67d64cd1','en','2011-08-29 21:17:47',NULL,0,'2011-08-29 21:08:13','2011-08-29 21:17:47',1,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-08-29 21:36:07
