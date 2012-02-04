;;; pelm-objc.el --- PELM  objc 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:


(require 'objc-c-mode)

(add-to-list 'auto-mode-alist '("\\.mm?$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . objc-mode))

(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))

(defun xcode:buildandrun ()
  (interactive)
  (do-applescript
   (format
    (concat
     "tell application \"Xcode\" to activate \r"
     "tell application \"System Events\" \r"
     "     tell process \"Xcode\" \r"
     "          key code 36 using {command down} \r"
     "          key code 36 using {command down} \r"
     "    end tell \r"
     "end tell \r"
     ))))

(add-hook 'objc-mode-hook
      (lambda ()
      (define-key objc-mode-map (kbd "C-c r") 'xcode:buildandrun)
))

(setq ff-other-file-alist
      '(("\\.mm?$" (".h"))
	("\\.cc$"  (".hh" ".h"))
	("\\.hh$"  (".cc" ".C"))
	("\\.c$"   (".h"))
	("\\.h$"   (".c" ".cc" ".C" ".CC" ".cxx" ".cpp" ".m" ".mm"))
	("\\.C$"   (".H"  ".hh" ".h"))
	("\\.H$"   (".C"  ".CC"))
	("\\.CC$"  (".HH" ".H"  ".hh" ".h"))
	("\\.HH$"  (".CC"))
	("\\.cxx$" (".hh" ".h"))
	("\\.cpp$" (".hpp" ".hh" ".h"))
	("\\.hpp$" (".cpp" ".c"))))

;;(defun my-objc-mode-hook ()
;;   (auto-complete-mode 1))
;;(add-hook 'objc-mode-hook 'my-objc-mode-hook)

(add-hook 'objc-mode-hook
    (lambda ()
    (define-key c-mode-base-map (kbd "C-c o") 'ff-find-other-file)
    (define-key c-mode-base-map (kbd "C-c a") 'auto-complete-mode)
))


(provide pelm-objc);

;;pelm-objc.el ends here
