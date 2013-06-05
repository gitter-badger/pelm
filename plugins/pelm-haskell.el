;;; pelm-haskell.el --- PELM  Haskell
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

(el-get 'sync "haskell-mode")

;; Add the current dir for loading haskell-site-file.
(add-to-list 'load-path ".")

;; Always load via this. If you contribute you should run `make all`
;; to regenerate this.
(load "haskell-site-file")

;; Customization
(custom-set-variables
 ;; Use cabal-dev for the GHCi session. Ensures our dependencies are in scope.
 '(haskell-process-type 'cabal-dev)
 
 ;; Use notify.el (if you have it installed) at the end of running
 ;; Cabal commands or generally things worth notifying.
 '(haskell-notify-p t)

 ;; To enable tags generation on save.
 '(haskell-tags-on-save t)

 ;; To enable stylish on save.
 '(haskell-stylish-on-save t))

;(add-hook 'haskell-mode-hook 'haskell-hook)

;(add-hook 'haskell-cabal-mode-hook 'haskell-cabal-hook)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; Haskell main editing mode key bindings.
(defun haskell-hook ()
  ;; Use simple indentation.
  (turn-on-haskell-simple-indent)
  (define-key haskell-mode-map (kbd "<return>") 'haskell-simple-indent-newline-same-col)
  (define-key haskell-mode-map (kbd "C-<return>") 'haskell-simple-indent-newline-indent)

  ;; Load the current file (and make a session if not already made).
  (define-key haskell-mode-map [?\C-c ?\C-l] 'haskell-process-load-file)
  (define-key haskell-mode-map [f5] 'haskell-process-load-file)

  ;; Switch to the REPL.
  (define-key haskell-mode-map [?\C-c ?\C-z] 'haskell-interactive-switch)
  ;; “Bring” the REPL, hiding all other windows apart from the source
  ;; and the REPL.
  
; (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)

  ;; Build the Cabal project.
;  (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  ;; Interactively choose the Cabal command to run.
;  (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)

  ;; Get the type and info of the symbol at point, print it in the
  ;; message buffer.
;  (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
;  (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)

  ;; Contextually do clever things on the space key, in particular:
  ;;   1. Complete imports, letting you choose the module name.
  ;;   2. Show the type of the symbol after the space.
;  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

  ;; Jump to the imports. Keep tapping to jump between import
  ;; groups. C-u f8 to jump back again.
  (define-key haskell-mode-map [f8] 'haskell-navigate-imports)

  ;; Jump to the definition of the current symbol.
  (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-tag-find)

  ;; Indent the below lines on columns after the current column.
  (define-key haskell-mode-map (kbd "C-<right>")
    (lambda ()
      (interactive)
      (haskell-move-nested 1)))
  ;; Same as above but backwards.
  (define-key haskell-mode-map (kbd "C-<left>")
    (lambda ()
      (interactive)
      (haskell-move-nested -1))))

;; Useful to have these keybindings for .cabal files, too.
(defun haskell-cabal-hook ()
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
  (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
  (define-key haskell-cabal-mode-map [?\C-c ?\C-z] 'haskell-interactive-switch))

;; ghc-mode setup
;; need install the ghc-mod with cabal
;; cabal install ghc-mod

(add-to-list 'exec-path (concat (getenv "HOME" ) "/.cabal/bin"))
(add-to-list 'load-path "~/.cabal/share/ghc-mod-2.0.2/")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

(defun my-smartchr-keybindings-haskell ()
  (local-set-key (kbd "+")  (smartchr '(" + " " ++ " "+")))
  (local-set-key (kbd "-")  (smartchr '(" - " "-- " "-")))
  (local-set-key (kbd "*")  (smartchr '("*" " * " " <*> ")))
  (local-set-key (kbd ")")  (smartchr '(")" " >> " " >>= ")))
  (local-set-key (kbd "(")  (smartchr '("(" " <=< ")))
  (local-set-key (kbd ">")  (smartchr '(" -> " " => " " > " ">")))
  (local-set-key (kbd "<")  (smartchr '(" <- " " <= " " < " "<")))
  (local-set-key (kbd ":")  (smartchr '(":" " :: " " : ")))
  (local-set-key (kbd ";")  (smartchr '(";" " :: " " : ")))
  (local-set-key (kbd "!")  (smartchr '("!" " !! " " ! ")))
  (local-set-key (kbd "$")  (smartchr '(" $ " " <$> " "$")))
  (local-set-key (kbd "=")  (smartchr '(" = " " /= " " == " "=")))
  (local-set-key (kbd "|")  (smartchr '("|" " | " )))
  (local-set-key (kbd "`")  (smartchr '("``!!'`" "`" )))
  (local-set-key (kbd ".")  (smartchr '("." " . " )))
  )

(dolist (hook (list
               'haskell-mode-hook
               ))
  (add-hook hook 'my-smartchr-keybindings-haskell))

(ac-define-source ghc-mod
  '((depends ghc)
    (candidates . (ghc-select-completion-symbol))
    (symbol . "s")
    (cache)))

(defun my-ac-haskell-mode ()
  (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-dictionary ac-source-ghc-mod)))
(add-hook 'haskell-mode-hook 'my-ac-haskell-mode)

(defun my-haskell-ac-init ()
  (when (member (file-name-extension buffer-file-name) '("hs" "lhs"))
    (auto-complete-mode t)
    (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-dictionary ac-source-ghc-mod))))

(add-hook 'find-file-hook 'my-haskell-ac-init)

(provide 'pelm-haskell)
;; pelm-haskell.el ends here


