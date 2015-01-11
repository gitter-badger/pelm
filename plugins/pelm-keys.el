;;; pelm-keys.el --- PELM global shortkeys
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs


(defmacro bind (&rest commands)
  "Convience macro which create a lambda interactive command."
  `(lambda ()
     (interactive)
     ,@commands))

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c" ","))
(guide-key-mode 1)  ; Enable guide-key-mode
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/highlight-command-regexp "rectangle\\|register")


(after "smex-autoloads"
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "C-x C-m") 'smex)
  (global-set-key (kbd "C-c C-m") 'smex))

(after 'evil
  (after "evil-leader-autoloads"
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      ;; common keys
      "e" 'find-file ;'helm-mini
      "r" 'org-capture
      "f" 'projectile-find-file
      "b" 'ido-switch-buffer
      "k" 'kill-buffer-no-question
      "w" 'evil-window-map)

    (after "magit-autoloads"
      (evil-leader/set-key
        "g s" 'magit-status
        "g b" 'magit-branch
        "g c" 'magit-commit
        "g l" 'magit-log
        )))

  (fill-keymap evil-normal-state-map
    "Y"     (kbd "y$")
    "+"     'evil-numbers/inc-at-pt
    "-"     'evil-numbers/dec-at-pt
    "go"    'goto-char
    "C-t"   'transpose-chars
    "C-:"   'eval-expression
    ":"     'evil-repeat-find-char-reverse
    "gH"    'evil-window-top
    "gL"    'evil-window-bottom
    "gM"    'evil-window-middle
    "H"     'beginning-of-line
    "L"     'end-of-line)

  (fill-keymap evil-motion-state-map
    "y"     'evil-yank
    "Y"     (kbd "y$")
    "_"     'evil-first-non-blank
    "C-e"   'end-of-line
    "C-S-d" 'evil-scroll-up
    "C-S-f" 'evil-scroll-page-up
    "_"     'evil-first-non-blank
    "C-y"   nil)

  (fill-keymap evil-insert-state-map
    "j"   'pelm/evil-maybe-exit
    "C-h" 'backward-delete-char
    "C-k" 'kill-line
    "C-y" 'yank
    "C-e" 'end-of-line)

  (after "ace-jump-mode-autoloads"
    (fill-keymap evil-operator-state-map
      "z" 'evil-ace-jump-char-mode)
    (fill-keymap evil-normal-state-map
      "s" 'evil-ace-jump-char-mode)
    (fill-keymap evil-motion-state-map
      "C-SPC" 'evil-ace-jump-line-mode))

  (after "helm-autoloads"
    (fill-keymap evil-normal-state-map
      "g b" 'helm-mini
      "<SPACE>f" 'helm-find-files
      "<SPACE>o" 'helm-imenu
      "<SPACE>t" 'helm-etags-select
      "<SPACE>y" 'helm-show-kill-ring
      "<SPACE>m" 'helm-bookmarks
      "<SPACE>r" 'helm-register)

    (after "helm-swoop-autoloads"
      (fill-keymap evil-normal-state-map
         "SPC-l" 'helm-swoop
         "SPC L" 'helm-multi-swoop)))

  (fill-keymap evil-normal-state-map ";" 'evil-window-map)
  (fill-keymap evil-normal-state-map ":" 'evil-ex)
  (fill-keymap evil-normal-state-map "TAB"  'evil-indent)
  (fill-keymap evil-visual-state-map "TAB"  'evil-indent)
  (fill-keymap evil-normal-state-map "C-t" nil)
  (fill-keymap evil-insert-state-map "C-t" nil)
  (fill-keymap evil-insert-state-map "C-O" 'evil-open-above)


  (define-key evil-window-map "v" 'split-window-vertically)
  (define-key evil-window-map "s" 'split-window-horizontally)
  (define-key evil-window-map "0" 'delete-window)
  (define-key evil-window-map "1" 'delete-other-windows)
  (define-key evil-window-map "2" 'split-window-below)
  (define-key evil-window-map "3" 'split-window-right)
  (define-key evil-window-map "4" 'ctl-x-4-prefix)
  (define-key evil-window-map "5" 'ctl-x-5-prefix)

)

(after 'auto-complete
  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous))


;;(global-set-key (kbd  "C-x C-f") 'helm-find-files)
(global-set-key  "\M-n" 'scroll-up-command)
(global-set-key  "\M-p" 'scroll-down-command)




;; projectile
(provide 'pelm-keys)
;;; pelm-keys.el ends here
