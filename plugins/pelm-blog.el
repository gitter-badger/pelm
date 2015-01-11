;;; pelm-misc.el --- PELM blog 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://iemacs.com/pelm


;; This file is not part of GNU Emacs

;;; Code:

(require 'org-page)
(setq op/repository-directory "~/src/personal/iemacs")
(setq op/theme-root-directory  "~/src/personal/iemacs/themes")
(setq op/theme 'mdo)
(setq op/site-domain "http://iemacs.org/")
(setq op/site-main-title "(:title \"大道至简\")")
(setq op/site-sub-title "==========> Simple is best.")
(setq op/personal-disqus-shortname "cakerweblog")
(setq op/personal-github-link "http://github.com/eggcaker")
(setq op/personal-google-analytics-id "")

(provide 'pelm-blog)
;;; pelm-blog ends here
