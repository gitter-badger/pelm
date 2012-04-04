;;; pelm-keys.el --- PELM just for fun
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Notes: 
;; load this just when you real know what this file does
;;

(defun hello_caker() 
  "show hi mesage "
  (interactive)
  (animate-string  "hi , I am caker, how are you ?" 6))

(global-set-key (kbd "\C-c h i i a m c a k e r h o w a r e y o u") 'hello_caker)





(provide 'pelm-fun)
