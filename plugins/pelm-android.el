;;; pelm-android.el --- PELM  android stuff 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

;; (android loader)
;(require 'android-mode)
(require 'android)
(require 'compile)

(defvar mvn-command-history nil
  "Maven command history variable")

(defun mvnfast()
  (interactive)
  (let ((fn (buffer-file-name)))
    (let ((dir (file-name-directory fn)))
      (while (and (not (file-exists-p (concat dir "/pom.xml"))) 
                  (not (equal dir (file-truename (concat dir "/..")))))
        (setq dir (file-truename (concat dir "/.."))))
      (if (not (file-exists-p (concat dir "/pom.xml")))
          (message "No pom.xml found")
;        (let (default-directory "/"))

;         (let default-directory (contact "/" "../"))
         (compile (concat "mvn -f " dir "/pom.xml install android:deploy -Dandroid.sdk.path=/usr/local/Cellar/android-sdk/r16 -Dmaven.test.skip=true"))))))

(define-key java-mode-map "\C-c\C-cc" 'mvnfast)

(defun mvn(&optional args)
  (interactive)
  (let ((fn (buffer-file-name)))
    (let ((dir (file-name-directory fn)))
      (while (and (not (file-exists-p (concat dir "/pom.xml")))
                  (not (equal dir (file-truename (concat dir "/..")))))
        (setq dir (file-truename (concat dir "/.."))))
      (if (not (file-exists-p (concat dir "/pom.xml")))
          (message "No pom.xml found")
        (compile (read-from-minibuffer "Command: "
                                       (concat "mvn -f " dir "/pom.xml install android:deploy -Dandroid.sdk.path=/usr/local/Cellar/android-sdk/r16  -Dmaven.test.skip=true")
                                       nil nil 'mvn-command-history))))))
;; String pattern for locating errors in maven output. This assumes a Windows drive letter at the beginning


;(add-to-list 'compilation-error-regexp-alist '("^[ERROR] (.*?):\\[([0-9]+),([0-9]+)\\].*$" 1 2 ))



(provide 'pelm-android)

;;pelm-android.el ends here
