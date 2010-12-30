; theme configuration

(require 'color-theme)
(color-theme-initialize)
;(color-theme-classic)
(color-theme-github)
;(color-theme-twilight)
;(color-theme-merbivore)


;;disable splash screen and tools bar
(custom-set-variables
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(joc-eshell-prompt-newline t)
 '(scroll-bar-width nil t)
 '(tool-bar-mode nil nil (tool-bar)))
