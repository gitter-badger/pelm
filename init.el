;; PELM - init.el
;; Author: caker
;; Last modified: 2012-09-19
;; Version: 1.7.0

(require 'cl)

;; pelm start time 
(defvar *pelm-load-start* (current-time))

(defvar pelm-dir (file-name-directory load-file-name)
  "The root dir of the PELM distribution.")

;; hooks to run function before and after load the pelm 
(defvar pelm-pre-init-hook nil)
(defvar pelm-post-init-hook nil)


(defvar pelm-plugins-dir (concat pelm-dir "plugins/")
  "This directory houses all of the built-in plem plugin.
   you should avoid modifying the configuration there.")

(defvar pelm-vendor-dir (concat pelm-dir "vendor/")
  "This directory house third part packages of emacs")

;; TODO remove 
(defvar pelm-el-get-dir (concat pelm-dir "el-get/")
  "This directory house the el-get packages")

(add-to-list 'load-path '(
                          pelm-plugins-dir
                          pelm-vendor-dir
                          pelm-el-get-dir))

(load (concat pelm-dir "pre-init"))
(run-hooks 'pelm-pre-init-hook)

;; define pelm plugins
(setq pelm-plugins 
      '(
        pelm-package
        pelm-runtime
        pelm-editor
        pelm-keys
        pelm-ui
        pelm-shell
        pelm-server
        pelm-ac
        pelm-git
        pelm-yas
        pelm-org
        pelm-evil
        pelm-c
        pelm-markups
        pelm-scala
        pelm-java
        pelm-php
        pelm-js
        pelm-lisp
        pelm-objc
        pelm-misc
        pelm-blog
        pelm-mail
        pelm-fun
        pelm-android
))

;; load plugins 
(dolist (plugin pelm-plugins)
  (require plugin))


(cond
    ((string-match "apple-darwin" system-configuration)
     (require 'pelm-mac))
    
    ((string-match "linux" system-configuration)
     (require 'pelm-linux))

    ((string-match "nt" system-configuration)
     (require 'pelm-windows)))

;; pelm-post-hook 
(load (concat pelm-dir "post-init"))
(run-hooks 'pelm-post-init-hook)


;; PELM loaded ,show load time 
(message  "PELM loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                                (- (+ hi lo) (+ (first *pelm-load-start*)
                                                (second *pelm-load-start*)))))
;;; ends init.el here

