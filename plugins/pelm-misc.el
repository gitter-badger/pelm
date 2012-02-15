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
(display-time)

(provide 'pelm-misc)

;; pelm-misc.el ends here
