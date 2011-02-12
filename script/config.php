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
        'jabber' => array('name' =>'jabber.org',
                          'folder' => 'jabber',
                          'description' => 'jabber client'),
        'php' => array('name'=>'php.org',
                       'folder' =>'php',
                       'description' => 'PHP language'),
        'objc' => array('name'=>'loader.el',
                        'folder' => 'objc',
                        'disabled' => true,
                        'description' => 'Objective-C mode'),
        'org' => array('name' => 'org.org',
                       'folder' => 'org',
                       'disabled' => true,
                       'description' => 'org-mode configurations '),
        'ac' => array('name' => 'loader.el',
                      'folder' => 'ac',
                      'description' => 'auto-complete mode'),
        'yasnippet' => array('name' => 'loader.el',
                             'folder' =>'yasnippet',
                             'description'=>' yansippet module'),
        'blog' => array('name'=>'loader.el',
                        'folder' => 'blog',
                        'disabled' => true,
                        'description' =>'blog staff jekyll'),
        'markups' => array('name' => 'loader.el', 
                           'folder' => 'markups',
                           'disabled' => true,
                           'description' => 'Markdown and Textile '),
        'yaml' => array('name'=>'loader.el',
                        'folder' => 'yaml',
                        'disabled' =>true,
                        'description' => 'yaml-mode'),
        'geben' => array('name'=>'loader.el',
                         'folder' =>'geben',
                         'disabled' => true,
                         'description' => 'xdebug plugin for Emacs'),
        'cedet' => array('name'=>'common/cedet.el',
                         'folder' => 'cedet',
                         'disabled' => true,
                         'description' => 'cedet'),
        'ecb' => array('name'=>'loader.el',
                       'folder' => 'ecb',
                       'disabled' => true,
                       'description' => 'ecb - Emacs Code Browser'),
        'jde' => array('name'=>'loader.el',
                        'folder' => 'jde',
                        'disabled' => true,
                       'description' => 'Java Development Envriment for Emacs '),
        'project' => array('name'=>'loader.el',
                           'folder' => 'project',
                           'disabled' => true,
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

