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



(defun open_blog_file ()
  "open the blog file "
  (interactive)
  (find-file "~/src/Mine/eggcaker.github.com/_src/org/blog-2012.org")
  (end-of-buffer))

(define-key pelm-keymap "b" 'open_blog_file)


(provide 'pelm-blog)


;;; pelm-blog ends here
