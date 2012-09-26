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
 '(android-mode-sdk-dir "/usr/local/Cellar/android-sdk/r20"))

(setenv "ANDROID_HOME" "/usr/local/Cellar/android-sdk/r20")


;; enabled error line number jumper 

(add-to-list 'compilation-error-regexp-alist 'maven)
(add-to-list 'compilation-error-regexp-alist-alist
       '(maven "\\[ERROR\\] \\(.+?\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\].*"
           1 2 3))

(defun pelm-search-android-doc ()
  "search the string from android api document"
  (interactive )
  (browse-url (concat "http://developer.android.com/reference/packages.html#q=" 
                                     (thing-at-point 'word))))

(define-key  pelm-keymap "ad" 'pelm-search-android-doc)

;; regular normal state shortcuts.
(evil-define-key 'normal android-mode-map
  ",ac" 'android-ant-debug
  ",ai" 'android-ant-installd
  ",ad" 'pelm-search-android-doc
)


(provide 'pelm-android)
;;pelm-android.el ends here
