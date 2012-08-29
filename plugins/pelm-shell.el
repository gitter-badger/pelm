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
 '(explicit-shell-file-name "~/bin/shell"))



(defun pelm-eshell-clear ()
  "Clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(define-key pelm-keymap "\C-l" 'pelm-eshell-clear)
;; eshell + zsh

(let ((zshpath "/Users/eggcaker/.rvm/gems/ruby-1.9.3-head/bin:/Users/eggcaker/.rvm/gems/ruby-1.9.3-head@global/bin:/Users/eggcaker/.rvm/rubies/ruby-1.9.3-head/bin:/Users/eggcaker/.rvm/bin:/Users/eggcaker/bin:/Users/eggcaker/.oh-my-zsh/bin:/Users/eggcaker/Applications/pear/bin:/usr/local/Cellar/android-sdk/r20/tools:/usr/local/Cellar/android-sdk/r20/platform-tools:/usr/local/Cellar/android-ndk/r8/bin:/Users/eggcaker/.rvm/bin:/Users/eggcaker/.oh-my-zsh/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/usr/texbin:"))
  (let ((pathlst (split-string zshpath ":")))
    (setq exec-path pathlst))
  (setq eshell-path-env zshpath)
  (setenv "PATH" zshpath))

(provide 'pelm-shell)

;;; pelm-shell.el ends here
