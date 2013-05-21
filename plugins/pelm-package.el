;;; pelm-ac.el --- PELM talking with el-get 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:

(require 'package)

(setq package-archives 
      (cons '("tromey" . "http://tromey.com/elpa/") package-archives))

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
(el-get 'sync)

(add-to-list 'load-path (concat pelm-dir "/el-get/el-get"))
(setq el-get-user-package-directory (concat pelm-plugins-dir "conf"))

;(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
(setq el-get-verbose t)


;; set pelm recipes
(setq el-get-sources
      '((:name smex				; a better (ido like) M-x
               :after   (progn
                        (setq smex-save-file (concat pelm-dir ".smex-items"))
                        (global-set-key (kbd "M-x") 'smex)
                        (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

        (:name magit				; git meet emacs, and a binding
               :after   (progn
                        (global-set-key (kbd "C-x C-z") 'magit-status)))

        (:name highlight-parentheses
               :after   (progn
                          (add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode )))


        (:name auto-pair-plus
               :after   (progn
                          (autopair-global-mode) ;;enabled in all buffers
                          (add-hook 'emacs-lisp-mode-hook 'autopair-mode )
                          (add-hook 'clojure-mode-hook 'autopair-mode)
                          ))

        (:name goto-last-change		; move pointer back to last change
               :after   (progn
                        ;; when using AZERTY keyboard, consider C-x C-_
                        (global-set-key (kbd "C-x C-/") 'goto-last-change)))))

;; now set pelm packages
(setq pelm:el-get-packages
      '(el-get
	popup
        auto-complete
        color-theme
        color-theme-solarized
        psvn
        magithub
        fuzzy
        lua-mode
        coffee-mode
        markdown-mode
        yaml-mode
        yasnippet
        emacs-w3m
        clojure-mode
;        slime
        ;;offlineimap
        sunrise-commander
        browse-kill-ring
        ;js3-mode
        ;;mu4e
        column-marker
        gtags
        android-mode
        ace-jump-mode
       ; cl-lib
        cperl-mode
        ;;gtags
        ace-jump-mode
        dropdown-list
        android-mode
        ))             

(setq pelm:el-get-packages
      (append
       pelm:el-get-packages
       (loop for src in el-get-sources collect (el-get-source-name src))))


;; install new packages and init already installed packages
(el-get 'sync pelm:el-get-packages)





(provide 'pelm-package)
;;; pelm-package.el ends here


