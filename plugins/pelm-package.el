;;; pelm-ac.el --- PELM el-get 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el" 
                (lambda (s) (goto-char (point-max)) (eval-print-last-sexp))))

(require 'el-get-autoloads)
(provide 'pelm-package)

;;; pelm-package.el ends here

