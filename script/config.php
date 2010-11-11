<?php
/**
 * Configuration of PELM
 * Website: http://webcaker.com/pelm
 * Author: Caker <eggcaker@gmail.com>
 */

define('DS', DIRECTORY_SEPARATOR);
error_reporting(E_ERROR); //only show the error if goes problem

//.emacs.d directory, you can define by hand
defined('EDD') or define('EDD', dirname(dirname(dirname(__FILE__).DS.'..'.DS)).DS);


$packages = array(
    'runtime' => array(
        'init' => array('name' => 'loader.el',
                        'description' => 'runtime functions')
        ),
    'common' => array(
        'theme' => array('name' => 'theme.el',
                         'description' => 'Theme configuration'),
        'shortkyes' => array('name' => 'shortkeys.el',
                             'description' => 'Keyboard remark'),
        'format' => array('name' => 'format.el',
                          'description' => 'Code formating lisp'),
        'misc' => array('name' => 'misc.el',
                        'description' => 'Misc Configurations')
        ),

    'modules' => array(
        'twitter' => array('name' =>'loader.el',
                          'folder' => 'twitter',
                          'description' => 'twitter client'),
        'jabber' => array('name' =>'loader.el',
                          'folder' => 'jabber',
                          'description' => 'jabber client'),
        'php' => array('name'=>'loader.el',
                       'folder' =>'php',
                       'description' => 'PHP language'),
        'objc' => array('name'=>'loader.el',
                        'folder' => 'objc',
                        'description' => 'Objective-C mode'),
        'org' => array('name' => 'loader.el',
                       'folder' => 'org',
                       'description' => 'org-mode'),
        'ac' => array('name' => 'loader.el',
                      'folder' => 'ac',
                      'description' => 'auto-complete mode'),
        'yasnippet' => array('name' => 'loader.el',
                             'folder' =>'yasnippet',
                             'description'=>' yansippet module'),
        'blog' => array('name'=>'loader.el',
                        'folder' => 'blog',
                        'description' =>'blog staff jekyll'),
        'markups' => array('name' => 'loader.el', 
                           'folder' => 'markups',
                           'description' => 'Markdown and Textile '),
        'yaml' => array('name'=>'loader.el',
                        'folder' => 'yaml',
                        'description' => 'yaml-mode'),
        'geben' => array('name'=>'loader.el',
                         'folder' =>'geben',
                           'description' => 'xdebug plugin for Emacs'),
        'cedet' => array('name'=>'common/cedet.el',
                       'folder' => 'cedet',
                        'description' => 'cedet'),
        'ecb' => array('name'=>'loader.el',
                       'folder' => 'ecb',
                        'description' => 'ecb - Emacs Code Browser'),
        'project' => array('name'=>'loader.el',
                       'folder' => 'project',
                           'description' => 'Project support '),
        'git' => array('name'=>'loader.el',
                       'folder' => 'git',
                       'description' => 'magit support '),
        'android' => array('name' => 'loader.el',
                           'folder' => 'android',
                           'description' => 'android development staff')
        ),
    'apps' => array(  ), //some apps ?? like mail irc ?

    'os' => array(
        'win' => array('name' => 'win.el',
                       'description' => 'customize for windows'),
        'linux' => array('name' => 'linux.el',
                         'description' => 'customize for linux os'),
        'mac' => array('name' => 'mac.el',
                       'description' => 'customize for mac os x')
        ),

    //for personal customzie
    'private' => array(
        'caker' => array('name' => 'caker.el',
                         'description' => "caker's emacs config")
        )
    );

