;;; pelm-runtime.el --- PELM runtime 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm
;; Version: 0.5.0

;; This file is not part of GNU Emacs

;;; Comentary:


;;; License:

;; MIT license

;;; Code:

(require 'cl)


(defvar *emacs-load-start* (current-time))

(defun package-manager-time-delta (old-time)
  (let* ((new-time (current-time))
         (old-time-in-msecs (+ (* (second old-time) 1000000)
                               (third old-time)))
         (new-time-in-msecs (+ (* (second new-time) 1000000)
                               (third new-time))))
    (message "start at:%s end at:%s" old-time new-time)
    (- new-time-in-msecs old-time-in-msecs)))

(defun package-manager-show-load-time ()
  (message "EMACS LOADED at %f seconds"
           (/ (package-manager-time-delta *emacs-load-start*) (float 1000000))))

(defun package-manager-timer (start)
  (if start
      (setq package-manager-timer-start (current-time))
    (package-manager-time-delta package-manager-timer-start)))


(defun pelm-add-sub-folders-to-load-path (parent-dir)
  "Adds all first level parent-dir subdirs to the Emacs load path"
  (dolist (f (directory-files parent-dir))
    (let ((name (concat parent-dir f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

;; add the first level subfolders of vendor 
(pelm-add-sub-folders-to-load-path pelm-vendor-dir)


;; set encodding to utf8
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(provide 'pelm-runtime)
;;; pelm-runtime.el ends here
