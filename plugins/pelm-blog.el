;;; pelm-misc.el --- PELM blog 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:


;; o-blog 
(setq pelm:blog-packages
      '(
        htmlize
        o-blog
        ))

(el-get 'sync pelm:blog-packages)

(define-key pelm-keymap "op" 'org-publish-blog)

(require 'jo-exporter)


(provide 'pelm-blog)


;;; pelm-blog ends here
