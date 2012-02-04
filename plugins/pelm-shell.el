;;; pelm-shell.el --- PELM shell configuration 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

;; shortcut for shell
(global-set-key "\C-x\C-z" 'shell) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(eval-after-load 'shell
  '(progn
     (define-key shell-mode-map [up] 'comint-previous-input)
     (define-key shell-mode-map [down] 'comint-next-input)
     (define-key shell-mode-map "\C-p" 'comint-previous-input)
     (define-key shell-mode-map "\C-n" 'comint-next-input)))

(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
(xterm-mouse-mode t)  


(provide 'pelm-shell)

;;; pelm-shell.el ends here
