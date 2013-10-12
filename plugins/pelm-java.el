;;; pelm-java.el --- PELM java-mode
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:



(autoload 'gtags-mode "gtags" "" t)


(add-to-list 'auto-mode-alist '("\\.java$" . java-mode))

(global-auto-complete-mode t)
(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))

(provide 'pelm-java)

;;; pelm-java.el ends here
