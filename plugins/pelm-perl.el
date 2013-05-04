;;; pelm-php.el --- PELM  PHP
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

(el-get-install "cperl-mode")
(defalias 'perl-mode 'cperl-mode)
(setq-default indent-tabs-mode nil)

;; use 2 spaces intent via cperl mode
(custom-set-variables
 '(cperl-close-paren-offset -2)
  '(cperl-continued-statement-offset 2)
  '(cperl-indent-level 2)
  '(cperl-indent-parens-as-block t)
  '(cperl-tab-always-indent t)
 )

(provide 'pelm-perl)
;; pelm-perl.el ends here
