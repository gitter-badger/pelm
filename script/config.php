<?php
/**
 * Configuration of ELM
 * Author: Caker <eggcaker@gmail.com>
 */

define('DS', DIRECTORY_SEPARATOR);
error_reporting(E_ERROR); //only show the error if goes problem

//.emacs.d directory, you can define by hand
defined('EDD') or define('EDD', dirname(dirname(dirname(__FILE__).DS.'..'.DS)).DS);


$packages = array(
    'runtime' => array(
        'init' => array('name' => 'init.el',
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
        'php' => array('name'=>'init.el',
                       'folder' =>'php',
                       'description' => 'PHP language'),
        'objc' => array('name'=>'init.el',
                        'folder' => 'objc',
                        'description' => 'Objective-C mode'),
        'org' => array('name' => 'init.el',
                       'folder' => 'org',
                       'description' => 'org-mode'),
        'ac' => array('name' => 'init.el',
                      'folder' => 'ac',
                      'description' => 'auto-complete mode'),
        'yasnippet' => array('name' => 'init.el',
                             'folder' =>'yasnippet',
                             'description'=>' yansippet module'),
        'blog' => array('name'=>'init.el',
                        'folder' => 'blog',
                        'description' =>'blog staff jekyll'),
        'markups' => array('name' => 'init.el', 
                           'folder' => 'markups',
                           'description' => 'Markdown and Textile '),
        'yaml' => array('name'=>'init.el',
                        'folder' => 'yaml',
                        'description' => 'yaml-mode'),
        'geben' => array('name'=>'init.el',
                         'folder' =>'geben',
                           'description' => 'xdebug plugin for Emacs'),
        'cedet' => array('name'=>'common/cedet.el',
                       'folder' => 'cedet',
                        'description' => 'cedet'),
        'ecb' => array('name'=>'init.el',
                       'folder' => 'ecb',
                        'description' => 'ecb - Emacs Code Browser'),
        'git' => array('name'=>'init.el',
                       'folder' => 'git',
                       'description' => 'magit support ')
        ),
    'apps' => array(
        //emms or mail ?
        ),
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

