;;; pelm-ac.el --- PELM talking with el-get 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:



(require 'cl)

(add-to-list 'load-path (concat pelm-dir "/el-get/el-get"))

(unless (require 'el-get nil t)
  (url-retrieve 
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

;; set pelm recipes
(setq el-get-sources
      '((:name smex				; a better (ido like) M-x
               :after (lambda ()
                        (setq smex-save-file (concat pelm-dir ".smex-items"))
                        (global-set-key (kbd "M-x") 'smex)
                        (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

        (:name magit				; git meet emacs, and a binding
               :after (lambda ()
                        (global-set-key (kbd "C-x C-z") 'magit-status)))

        (:name goto-last-change		; move pointer back to last change
               :after (lambda ()
                        ;; when using AZERTY keyboard, consider C-x C-_
                        (global-set-key (kbd "C-x C-/") 'goto-last-change)))))

;; now set pelm packages
(setq pelm:el-get-packages
      '(el-get				; el-get is self-hosting
        escreen       			; screen for emacs, C-\ C-h
        switch-window			; takes over C-x o
        auto-complete			; complete as you type with overlays
        zencoding-mode			; http://www.emacswiki.org/emacs/ZenCoding
        color-theme	                ; nice looking emacs
        color-theme-tango               ; check out color-theme-solarized
        ensime
        ))             

;;
;; Some recipes require extra tools to be installed
;;
;; Note: el-get-install requires git, so we know we have at least that.
;;

(when (el-get-executable-find "svn")
  (loop for p in '(psvn    		; M-x svn-status
                   yasnippet		; powerful snippet mode
		   )
	do (add-to-list 'pelm:el-get-packages p)))

(setq pelm:el-get-packages
      (append
       pelm:el-get-packages
       (loop for src in el-get-sources collect (el-get-source-name src))))


;; install new packages and init already installed packages
(el-get 'sync pelm:el-get-packages)





(provide 'pelm-package)
;;; pelm-package.el ends here

