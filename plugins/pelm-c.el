;;; pelm-c.el --- PELM c-mode
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm
;; Version: 0.5.0

;; This file is not part of GNU Emacs

;;; Code:

(defconst pelm-c-style
  '((c-offsets-alist . ((substatement-open . 0)
			(defun-block-intro . 4)
			(statement-block-intro . 4)
			(case-label . 4)
			;;(inclass . 0)
            ;;(topmost-intro . 0)
			(inher-cont . 4)
			(inline-open . 4)))
    (c-echo-syntactic-information-p . t)))

(defun pelm-c-mode-common-hook ()
  (c-add-style "pelm-c" pelm-c-style t)
  (setq tab-width 4 indent-tabs-mode nil)) ;; indent with spaces not tabs

(add-hook 'c-mode-common-hook  'pelm-c-mode-common-hook)


(setq c-default-style "bsd"
      c-basic-offset 4)

(setq c-mode-hook
      (function (lambda()
		  (setq indent-tabs-mode nil)
		  (setq c-indent-level 4))))
(setq objc-mode-hook
      (function (lambda ()
		  (setq indent-tabs-mode nil)
		  (setq c-indent-level 4))))
(setq c++-mode-hook
      (function (lambda ()
		  (setq indent-tabs-mode nil)
		  (setq c-indent-level 4))))

(setq nxml-mode-hook
      (function (lambda ()
		  (setq indent-tabs-mode nil)
		  (setq c-indent-level 4))))

(setq tab-width 4)

(add-hook 'first-change-hook
          (lambda () (setq indent-tabs-mode nil)))

(provide 'pelm-c)

;;; pelm-c.el ends here
