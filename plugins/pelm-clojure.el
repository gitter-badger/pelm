;;; pelm-haskell.el --- PELM Cloure 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

;; install packages for clojure
(el-get 'sync '(nrepl paredit rainbow-delimiters ac-nrepl))


;; configuration
(add-hook 'nrepl-interaction-mode-hook  'nrepl-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)

(setq nrepl-popup-stacktraces nil)
(setq nrepl-popup-stacktraces-in-repl t)
(add-to-list 'same-window-buffer-names "*nrepl*")
;;COTO - how the subword mode working
(add-hook 'nrepl-mode-hook 'subword-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)

(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

(provide 'pelm-clojure)
;; pelm-clojure.el ends here
