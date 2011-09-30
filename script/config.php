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
        'theme' => array('name' => 'pelm-theme.org',
                         'description' => 'Theme configuration'),
        'shortkyes' => array('name' => 'pelm-shortkeys.org',
                             'description' => 'Keyboard remark'),
        'format' => array('name' => 'pelm-format.org',
                          'description' => 'Code formating lisp'),
        'misc' => array('name' => 'pelm-misc.org',
                        'description' => 'Misc Configurations')
        ),

    'modules' => array(
        'jabber' => array('name' =>'pelm-jabber.org',
                          'folder' => 'jabber',
                          'disabled' =>true,
                          'description' => 'jabber client'),
        'php' => array('name'=>'pelm-php.org',
                       'folder' =>'php',
                       'description' => 'PHP language'),
        'ess' => array('name' => 'pelm-ess.org',
                       'folder' => 'ess',
                       'disabled' => true,
                       'description' => 'ess package'),
        'objc' => array('name'=>'loader.el',
                        'folder' => 'objc',
                        'disabled' => true,
                        'description' => 'Objective-C mode'),
        'org' => array('name' => 'pelm-org.org',
                       'folder' => 'org',
                       'description' => 'org-mode configurations '),
        'ac' => array('name' => 'loader.el',
                      'folder' => 'ac',
                      'description' => 'auto-complete mode'),
        'yasnippet' => array('name' => 'loader.el',
                             'folder' =>'yasnippet',
                             'description'=>' yansippet module'),
        'blog' => array('name'=>'pelm-blog.org',
                        'folder' => 'blog',
                        'disabled' => true,
                        'description' =>'blog staff for jekyll'),
        'markups' => array('name' => 'loader.el', 
                           'folder' => 'markups',
                           'description' => 'Markdown and Textile '),
        'yaml' => array('name'=>'loader.el',
                        'folder' => 'yaml',
                        'disabled' =>true,
                        'description' => 'yaml-mode'),
        'geben' => array('name'=>'loader.el',
                         'folder' =>'geben',
                         'disabled' => true,
                         'description' => 'xdebug plugin for Emacs'),
        'ecb' => array('name'=>'loader.el',
                       'folder' => 'ecb',
                       'disabled' => true,
                       'description' => 'ecb - Emacs Code Browser'),
        'twitter' => array('name'=>'pelm-twitter.org',
                       'folder' => 'twitter',
                        'disabled' => true,
                       'description' => 'twitter mode for emacs'),
        'weibo' => array('name'=>'pelm-weibo.org',
                       'folder' => 'weibo',
                        'disabled' => true,
                       'description' => 'weibo mode for emacs'),
        'jde' => array('name'=>'loader.el',
                       'folder' => 'jde',
                       'disabled' => true,
                       'description' => 'Java Development Envriment for Emacs '),
        'project' => array('name'=>'loader.el',
                           'folder' => 'project',
                           'disabled' => true,
                           'description' => 'Project support '),
        'git' => array('name'=>'loader.el',
                       'disabled' => true,
                       'folder' => 'git',
                       'description' => 'magit support '),
        'github' => array('name'=>'pelm-github.org',
                       'folder' => 'github',
                       'description' => 'github support '),
        'android' => array('name' => 'pelm-android.org',
                           'folder' => 'android',
                           'description' => 'android development staff'),
        'csharp' => array('name' => 'pelm-csharp.org',
                          'folder' => 'csharp', 
                          'disabled' => true,
                          'description' => 'c # development stuff '),
        'groovy' => array('name' => 'pelm-groovy.org',
                          'folder' => 'groovy',
                          'disabled' => true,
                          'description' => 'groovy mode ' )
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
        'caker' => array('name' => 'pelm-caker.org',
                         'description' => "caker's emacs config")
        )
    );

