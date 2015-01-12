;;; pelm-js.el --- PELM  js-mode
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:


(load "editorconfig")
(require 'coffee-mode)
(require 'js3-mode)

(add-hook 'js3-mode-hook
  (lambda ()
    (setq js3-auto-indent-p t
      js3-curly-indent-offset 0
      js3-enter-indents-newline t
      js3-expr-indent-offset 2
      js3-indent-on-enter-key t
      js3-lazy-commas t
      js3-lazy-dots t
      js3-lazy-operators t
      js3-paren-indent-offset 2
      js3-square-indent-offset 4)
    (tern-mode 1)
    (flymake-mode 1)
    (linum-mode 1)))

(add-to-list 'ac-modes 'js3-mode)

(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'js3-mode-hook (lambda () (tern-mode t)))
(setq tern-command (cons (executable-find "tern") '()))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js3-lazy-commas t)
 '(js3-lazy-operators t)
 '(js3-lazy-dots t)
 '(js3-expr-indent-offset 2)
 '(js3-paren-indent-offset 2)
 '(js3-square-indent-offset 2)
 '(js3-curly-indent-offset 2)
 '(js3-auto-indent-p t)         ; it's nice for commas to right themselves.
 '(js3-enter-indents-newline t) ; don't need to push tab before typing
 '(js3-indent-on-enter-key t)   ; fix indenting before moving on
 )

(autoload 'js3-mode "js3" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.jake$" . js3-mode))
(add-to-list 'auto-mode-alist '("jakefile$" . js3-mode))

;;; coffee mode
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

(add-hook 'js3-mode-hook 'skewer-mode)
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

;(require 'slime-js)


(add-hook 'js3-mode-hook
  (lambda ()
    ;(slime-js-minor-mode 1)
    ))

(add-hook 'css-mode-hook
  (lambda ()
    (define-key css-mode-map (kbd "M-C-x") 'slime-js-refresh-css)
    (define-key css-mode-map (kbd "C-c C-r") 'slime-js-embed-css)))

;; Wow, swank-js has lots of dependencies.
;(require 'slime)
(executable-find "npm")
(executable-find "swank-js")

(eval-after-load 'auto-complete
  '(progn
     (add-to-list 'ac-modes 'js-mode)
     (add-to-list 'ac-modes 'js2-mode)
     (add-to-list 'ac-modes 'js3-mode)
     ;(add-hook 'slime-mode-hook 'set-up-slime-ac)
     (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)))

(eval-after-load 'slime
  '(progn
     (slime-setup '(slime-repl slime-js))))

(add-hook 'js2-mode-hook #'flycheck-mode)
(add-hook 'js3-mode-hook #'flycheck-mode)

(provide 'pelm-js)
;; pelm-js.el ends here
