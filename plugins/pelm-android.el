;;; pelm-android.el --- PELM  android stuff 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

(require 'android-mode)
(require 'thingatpt)

(custom-set-variables
 '(android-mode-sdk-dir "/usr/local/opt/android-sdk"))

(setenv "ANDROID_HOME" "/usr/local/opt/android-sdk")


;; enabled error line number jumper 

(add-to-list 'compilation-error-regexp-alist 'maven)
(add-to-list 'compilation-error-regexp-alist-alist
       '(maven "\\[ERROR\\] \\(.+?\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\].*"
           1 2 3))

(defun pelm-search-android-doc ()
  "search the string from android api document"
  (interactive )
  (browse-url (concat "https://developer.android.com/reference/packages.html#q=" 
                                     (thing-at-point 'word))))

(define-key  pelm-keymap "ad" 'pelm-search-android-doc)
(eval-after-load 'android-mode 
  '(progn 
     (message "android loadded")
;; regular normal state shortcuts.
(evil-define-key 'normal android-mode-map
  ",ac" 'android-build-debug
  ",al" 'android-logcat
  ",as" 'android-start-app
  ",ar" 'android-build-reinstall
  ",au" 'android-build-uninstall
  ",ad" 'pelm-search-android-doc)))



;; build.gradle should use groovy 
(add-to-list 'auto-mode-alist '("\\.gradle$" . groovy-mode))

(provide 'pelm-android)
;;; pelm-android.el ends here


