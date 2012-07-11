;;; pelm-android.el --- PELM  android stuff 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

 (custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(android-mode-sdk-dir "/usr/local/Cellar/android-sdk/r20")
)

(setenv "ANDROID_HOME" "/usr/local/Cellar/android-sdk/r20")


(define-key pelm-keymap "ac" 'compile)

(require 'android-mode)

;; enabled error line number jumper 

(add-to-list 'compilation-error-regexp-alist 'maven)
(add-to-list 'compilation-error-regexp-alist-alist
       '(maven "\\[ERROR\\] \\(.+?\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\].*"
           1 2 3))

(provide 'pelm-android)

;;pelm-android.el ends here
