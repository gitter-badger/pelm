;; PELM - init.el
;; Author: caker
;; Last modified: 2012-10-30
;; Version: 1.8.0
;;


;; pelm start time 
(defvar *pelm-load-start* (current-time))

(defvar pelm-dir (file-name-directory load-file-name)
  "The root dir of the PELM distribution.")

;; define hooks to run function before and after load the pelm 
(defvar pelm-pre-init-hook nil)
(defvar pelm-post-init-hook nil)

(defvar pelm-plugins-dir (concat pelm-dir "plugins/")
  "This directory houses all of the built-in plem plugin.
   you should avoid modifying the configuration there.")

(defvar pelm-vendor-dir (concat pelm-dir "vendor/")
  "This directory house third part packages of emacs")

(defvar pelm-el-get-dir (concat pelm-dir "el-get/")
  "This directory house the el-get packages")

(add-to-list 'load-path pelm-plugins-dir)
(add-to-list 'load-path pelm-vendor-dir)
(add-to-list 'load-path pelm-el-get-dir)

(load (concat pelm-dir "pre-init-local") 'noerror)
(run-hooks 'pelm-pre-init-hook)

;; define pelm plugins
(setq pelm-plugins 
      '(
        runtime
        package
        keys
        server
        ui
        editor
        git
        yas
        org
        evil
        c
        markups
        ;scala
        haskell
        clojure
        lisp
        java
        php
        js
        ;objc
        blog
        mail
        android
        shell
        misc
))

;; load plugins 
(mapcar (lambda (x) 
	  (require (intern (format "pelm-%s" x)) nil t))
	pelm-plugins)


(cond
    ((string-match "apple-darwin" system-configuration)
     (require 'pelm-mac))
   
    ((string-match "linux" system-configuration)
     (require 'pelm-linux))

    ((string-match "nt" system-configuration)
     (require 'pelm-windows)))

;; pelm-post-hook 
(load (concat pelm-dir "post-init-local") 'noerror)
(run-hooks 'pelm-post-init-hook)

;; PELM loaded, show the load time 
(message  "PELM loaded in %ds" (destructuring-bind (hi lo ms nn ) (current-time)
                                (- (+ hi lo) (+ (first *pelm-load-start*)
                                                (second *pelm-load-start*)))))
;;; ends init.el here
