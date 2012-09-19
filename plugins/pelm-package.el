;;; pelm-package.el --- PELM talking with elpa
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
   (lambda(s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))
(el-get 'sync)

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
                          (add-hook 'emacs-lisp-mode-hook 'autopair-mode )
                          (add-hook 'clojure-mode-hook 'autopair-mode)
                          ))

        (:name goto-last-change		; move pointer back to last change
               :after   (progn
                        ;; when using AZERTY keyboard, consider C-x C-_
                        (global-set-key (kbd "C-x C-/") 'goto-last-change)))))

;; now set pelm packages
(setq pelm:el-get-packages
      '(el-get				; el-get is self-hosting
        auto-complete			; complete as you type with overlays
        color-theme	                ; nice looking emacs
        psvn
        magithub
        fuzzy
        lua-mode
        popup
        coffee-mode
        markdown-mode
        yaml-mode
        yasnippet
        emacs-w3m
        clojure-mode
        slime
        ;nxhtml
        offlineimap
        sunrise-commander
        browse-kill-ring
        ))             

(setq pelm:el-get-packages
      (append
       pelm:el-get-packages
       (loop for src in el-get-sources collect (el-get-source-name src))))


;; install new packages and init already installed packages
(el-get 'sync pelm:el-get-packages)





(provide 'pelm-package)
;;; pelm-package.el ends here


