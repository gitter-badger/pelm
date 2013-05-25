;;; pelm-misc.el --- PELM blog 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://iemacs.com/pelm


;; This file is not part of GNU Emacs

;;; Code:

(require 'ox-org)
(require 'ox-html)

(setq org-export-default-language "en"
      org-html-extension "html"
      org-export-with-timestamps t
      org-html-inline-images t
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-export-with-section-numbers nil
      org-export-with-tags t;'not-in-toc
      org-export-skip-text-before-1st-heading nil
      org-export-with-sub-superscripts '{}
      org-export-with-archived-trees nil
      org-export-highlight-first-table-line nil 
      org-export-latex-listings-w-names nil
      org-export-htmlize-output-type 'css
      org-startup-folded nil
      org-html-doctype "html5"
      org-export-allow-BIND t
      org-html-postamble-format nil
      org-publish-list-skipped-files t
      org-publish-use-timestamps-flag nil  ; nil for dev and t for prod
      org-export-babel-evaluate t
      org-confirm-babel-evaluate nil)


(defun set-org-publish-project-alist ()
  (interactive)
  (setq org-publish-project-alist
	`(
	  ("iemacs"
	   :base-directory ,iemacs-org-directory
	   :base-extension "org"
	   :exclude "scripts"
	   :html-extension "md"
	   :publishing-directory ,iemacs-publish-directory
           :publishing-function org-html-publish-to-html
	   :section-numbers nil
	   :with-toc t
           :body-only t
	   :recursive t
	   :html-preamble nil
	   :html-postamble nil
           :completion-function iemacs-fix-toc
	   )

          )))


(defun iemacs-fix-toc ()
  "reformat the toc part to top of file"
  (shell-command (concat "cd " iemacs-base-directory "; make format-org")) 
  )

(defun publish-iemacs nil
  "Publish iEmacs.com orgmode posts"
  (interactive)
  (let ((org-format-latex-signal-error nil)
        (iemacs-base-directory "~/src/personal/iemacs.com/")
        (iemacs-org-directory "~/src/personal/iemacs.com/org/")
        (iemacs-publish-directory "~/src/personal/iemacs.com/"))
    (set-org-publish-project-alist)
    (org-publish-project "iemacs")))

(provide 'pelm-blog)
;;; pelm-blog ends here
