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

(require 'org-install)
(require 'org-publish)
(require 'htmlize)

(setq org-publish-project-alist
      '(
        ("org-caker-me"
         ;; Path to your org files.
         :base-directory "~/src/Mine/eggcaker.github.com/_org/"
         :base-extension "org"
         :exclude "/files/"
         
         ;; Path to your Jekyll project.
         :publishing-directory "~/src/Mine/eggcaker.github.com/"
         :blog-publishing-directory "~/src/Mine/eggcaker.github.com/"
         :site-root "http://caker.me"
         :jekyll-sanitize-permalinks t
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 4
         :html-extension "html"
         :body-only t ;; Only export section between <body> </body>
         )
        ("org-static-caker-me"
         :base-directory "~/src/Mine/eggcaker.github.com/_org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|tgz"
         ;;:base-extension ".*"
         :publishing-directory "~/src/Mine/eggcaker.github.com/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("caker-me" :components ("org-caker-me" "org-static-caker-me"))
        ))


(require 'org-jekyll)
(setq org-jekyll-entry-match "+blog-TODO=\"TODO\"")

(defun pelm-el-sanitizer(s)
  "Sanitize string S"
  (if (equal (ob-sanitize-string s) "")
      (md5 s)
    (ob-sanitize-string s)))


(provide 'pelm-blog)




