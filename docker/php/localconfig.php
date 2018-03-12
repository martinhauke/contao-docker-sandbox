<?php

### INSTALL SCRIPT START ###
$GLOBALS['TL_CONFIG']['licenseAccepted'] = true;
# Password: 'password'
$GLOBALS['TL_CONFIG']['dbDriver'] = 'MySQLi';
$GLOBALS['TL_CONFIG']['dbHost'] = 'mysql';
$GLOBALS['TL_CONFIG']['dbUser'] = getenv('MYSQL_USER');
$GLOBALS['TL_CONFIG']['dbPass'] = getenv('MYSQL_PASSWORD');
$GLOBALS['TL_CONFIG']['dbDatabase'] = getenv('MYSQL_DATABASE');
$GLOBALS['TL_CONFIG']['dbPconnect'] = false;
$GLOBALS['TL_CONFIG']['dbCharset'] = 'UTF8';
$GLOBALS['TL_CONFIG']['dbPort'] = 3306;
$GLOBALS['TL_CONFIG']['dbSocket'] = '';
$GLOBALS['TL_CONFIG']['displayErrors'] = true;
### INSTALL SCRIPT STOP ###
