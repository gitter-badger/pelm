;;; package --- pelm-keys.el PELM shortkeys
;;; Commentary:
;;   all shortkeys
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

(defmacro bind (&rest commands)
  "Convience macro which create a lambda interactive COMMANDS."
  `(lambda ()
     (interactive)
     ,@commands))

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c" ","))
(guide-key-mode 1)
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
      "!" 'shell-command
      "u" 'universal-argument
      ;;"e" 'find-file ;'helm-mini
      ;;"c" 'org-capture
      ;"b" 'ido-switch-buffer
      "k" 'kill-buffer-no-question
      "w" 'evil-window-map)

    ;; applications ---------------------------------------------------------------
    (evil-leader/set-key
      "ac"  'calc-dispatch
      "ad"  'dired
      "ai"  'irc
      "ap"  'proced
      "ase" 'eshell
      "asi" 'shell
      "au"  'undo-tree-visualize)
    ;; buffers --------------------------------------------------------------------
    (evil-leader/set-key
      "bf" 'projectile-recentf
      "bb" 'ido-switch-buffer
      "bd"  'delete-current-buffer-file
      "be"  'erase-buffer
      "bK"  'kill-other-buffers
      "bk"  'ido-kill-buffer
      "bC-k" 'kill-matching-buffers-rudely
      "bn"  'switch-to-next-buffer
      "bp"  'switch-to-prev-buffer
      "bR"  (lambda () (interactive) (revert-buffer nil t))
      "br"  'rename-current-buffer-file)

    ;; describe functions ---------------------------------------------------------
    (evil-leader/set-key
      "hdf" 'describe-function
      "hdk" 'describe-key
      "hdm" 'describe-mode
      "hdv" 'describe-variable)
    ;; errors ---------------------------------------------------------------------
    (evil-leader/set-key
      "en" 'next-error
      "ep" 'previous-error)
    ;; find -----------------------------------------------------------------------
    (evil-leader/set-key
      "fi" 'ido-find-file
      "ff" 'projectile-find-file
      "fg" 'rgrep)
    ;; file -----------------------------------------------------------------------
    (evil-leader/set-key
      "fS" 'evil-write-all
      "fs" 'evil-write)
    ;; insert stuff ---------------------------------------------------------------
    (evil-leader/set-key
      "ij"  (lambda (count)
              "Insert a new line below with no identation."
              (interactive "p")
              (save-excursion
                (evil-move-end-of-line)
                (while (> count 0)
                  (insert "\n")
                  (setq count (1- count)))))
      "ik" 'evil-insert-line-above)
    ;; format ---------------------------------------------------------------------
    ;; replace J (no leader) key binding for a more frequent action:
    ;; go and indent line below the point
    ;; <SPC> J split the current line at point and indent it
    ;; evil-join can still be perfomed with <SPC> j k
    ;;(define-key evil-normal-state-map "J" (lambda () (interactive) (join-line 1) (sp-newline)))

    (evil-leader/set-key
      "J" 'sp-split-sexp
      "jJ" (lambda () (interactive) (sp-split-sexp 1) (sp-newline))
      "jj" 'sp-newline
      "jk" 'evil-join)
    ;; navigation -----------------------------------------------------------------
    (evil-leader/set-key
      "jh" (lambda () (interactive) (push-mark (point)) (evil-beginning-of-line))
      "jl" (lambda () (interactive) (push-mark (point)) (evil-end-of-line)))

    ;; Compilation ----------------------------------------------------------------
    (evil-leader/set-key "C" 'compile)

    ;; spell check  ---------------------------------------------------------------
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; (evil-leader/set-key               ;;
    ;;   "Sc" 'cofi/helm-flyspell-correct ;;
    ;;   "Sn" 'flyspell-goto-next-error)  ;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; toggle ---------------------------------------------------------------------
    (evil-leader/set-key
      "ta" 'org-agent
      "t8" 'toggle-fill-column-indicator
      "tF" 'fringe-mode
      "tff" 'toggle-frame-fullscreen
      "tfm" 'toggle-frame-maximized
      "tn" 'global-linum-mode
      "tw" 'toggle-read-only)
    ;; window ---------------------------------------------------------------------
    ;; (evil-leader/set-key "wb" 'evenly-split-window-right)
    (evil-leader/set-key
      "w2"  'layout-double-columns
      "w3"  'layout-triple-columns
      "wb"  'split-window-right
      "wc"  'delete-window
      "wd"  'toggle-current-window-dedication
      "wH"  'evil-window-move-far-left
      "wh"  'evil-window-left
      "wJ"  'evil-window-move-very-bottom
      "wj"  'evil-window-down
      "wK"  'evil-window-move-very-top
      "wk"  'evil-window-up
      "wL"  'evil-window-move-far-right
      "wl"  'evil-window-right
      "wM"  'toggle-maximize-centered-buffer
      "wm"  'toggle-maximize-buffer
      "wr"  'rotate-windows
      "wR"  'rotate-windows-backward
      ;; "wv"  'evenly-split-window-below)
      "wv"  'split-window-below
      ;;"wsh" 'shrink-window-horizontally
      ;;"wsj" 'shrink-window
      ;;"wsk" 'enlarge-window
      ;;"wsl" 'enlarge-window-horizontally
      "wU"  'winner-redo
      "wu"  'winner-undo
      "ww"  'other-window)
    ;; text -----------------------------------------------------------------------
    (evil-leader/set-key
      "xdw" 'delete-trailing-whitespace
      "xtl" 'transpose-lines
      "xtw" 'transpose-words)

    ;; Lisps ----------------------------------------------------------------------
    (evil-leader/set-key-for-mode 'emacs-lisp-mode
      "mD"  'elisp-slime-nav-describe-elisp-thing-at-point
      "mg"  'elisp-slime-nav-find-elisp-thing-at-point
      "mhv" 'describe-variable
      "mta"  (lambda () (interactive) (ert t))
      "mtf" 'ert)

;; git -------------------------
    (after "magit-autoloads"
      (evil-leader/set-key
        "gs" 'magit-status
        "gb" 'magit-branch
        "gc" 'magit-commit
        "gl" 'magit-log
        )))

  (fill-keymap evil-normal-state-map
    "Y"     (kbd "y$")
    "+"     'evil-numbers/inc-at-pt
    "-"     'evil-numbers/dec-at-pt
    "go"    'goto-char
    "TAB"   'evil-indent
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

  (fill-keymap evil-normal-state-map ";" 'evil-ex)
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

(provide 'pelm-keys)
;;; pelm-keys.el ends here
