;;; pelm-misc.el --- PELM misc
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:


(defun mp-insert-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d %A")))
 
(defun mp-insert-time ()
  (interactive)
  (insert (format-time-string "%X")))
 
(global-set-key (kbd "C-c i d") 'mp-insert-date)
(global-set-key (kbd "C-c i t") 'mp-insert-time)


(require 'find-dired)
(setq find-ls-option '("-print0 | xargs -0 ls -ld" . "-ld"))

(setq display-time-day-and-date t
      display-time-24hr-format t)

;  (setq system-time-locale "en_US.utf8")
   (setq system-time-locale "C")

(display-time )

;(setq system-time-locale "C")



(fset 'format_xml
      (lambda (&optional arg)
        "Keyboard macro."
        (interactive "p")
        (kmacro-exec-ring-item (quote ([19 34 32 13 return] 0 "%d")) arg)))


(defun swap-buffers-in-windows ()
  "Put the buffer from the selected window in next window, and vice versa"
  (interactive)
  (let* ((this (selected-window))
     (other (next-window))
     (this-buffer (window-buffer this))
     (other-buffer (window-buffer other)))
    (set-window-buffer other this-buffer)
    (set-window-buffer this other-buffer)
    )
  )

(define-key pelm-keymap "s" 'swap-buffers-in-windows)

;;  copy/paste with C-c and C-v and C-x, check out C-RET too
(cua-mode) 


;; o-blog 
(setq pelm:o-blog-packages
      '(
        htmlize
        o-blog
        emacs-http-server))

;; emacs-http-server 
;; a emacs http server 
;
; usage:
; (require 'httpd)
; (setq httpd-root "/path/to/site")
; (httpd-start)
(el-get 'sync pelm:o-blog-packages)

(define-key pelm-keymap "op" 'org-publish-blog)
(provide 'pelm-misc)

;; pelm-misc.el ends here
