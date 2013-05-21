;;; pelm-shell.el --- PELM shell configuration 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

;; shortcut for shell
;(global-set-key "\C-x\C-z" 'shell) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(eval-after-load 'shell
  '(progn
     (define-key shell-mode-map [up] 'comint-previous-input)
     (define-key shell-mode-map [down] 'comint-next-input)
     (define-key shell-mode-map "\C-p" 'comint-previous-input)
     (define-key shell-mode-map "\C-n" 'comint-next-input)))

(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

(xterm-mouse-mode t)  

(custom-set-variables
 '(explicit-shell-file-name "/usr/bin/zsh"))



(defun pelm-eshell-clear ()
  "Clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(define-key pelm-keymap "\C-l" 'pelm-eshell-clear)


;; eshell + zsh
;;TODO cleanup the zshpath

(setenv "PATH"
        (concat
         "/home/eggcaker/.dotfiles/bin" path-separator
         (getenv "PATH")
         ))

;;eshell alias to open file
(defalias 'o 'find-file)
(defalias 'oo 'find-file-other-widnow)

(provide 'pelm-shell)

;;; pelm-shell.el ends here


