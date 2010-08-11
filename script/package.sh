#!/bin/bash
PHP=`which php`
reldir=`dirname $0`
cd $reldir
directory=`pwd`

$PHP $directory/package.php  $*
