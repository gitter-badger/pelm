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

(setq max-specpdl-size 5)
(defconst my-objc-style
  '("objc"
    (c-indent-comments-syntactically-p . t)
    (c-comment-only-line-offset . 0)
    (c-cleanup-lisp  . (
                        brace-else-brace
                        brace-elseif-brace
                        empty-defun-braces
                        defun-close-semi
                        compact-empty-funcall
                        )))
  "PELM Objective-C Programming style")

(defun my-objc-mode-hook ()
  (auto-complete-mode t)
  (setq tab-width 2)
  (setq indent-tabs-mode nil)
  ;;TODO: some bugs here
  ;(c-add-style "objc" my-objc-style)
  )

(add-hook 'objc-mode-hook 'my-objc-mode-hook)

(add-hook 'objc-mode-hook
    (lambda ()
    (define-key c-mode-base-map (kbd "C-c o") 'ff-find-other-file)
))



;;macros for obj-c

(fset 'h2m
      (lambda (&optional arg)
        "Keyboard macro."
        (interactive "p")
        (kmacro-exec-ring-item (quote ([11 25 escape down return return 25 backspace 32 123 return 125 return escape up 14 1] 0 "%d")) arg)))



(require 'anything)
(require 'anything-config)

(defvar anything-c-source-objc-headline
  '((name . "Objective-C Headline")
    (headline  "^[-+@]\\|^#pragma mark")))

(defun objc-headline ()
  (interactive)
  ;; Set to 500 so it is displayed even if all methods are not narrowed down.
  (let ((anything-candidate-number-limit 500))
    (anything-other-buffer '(anything-c-source-objc-headline)
                           "*ObjC Headline*")))

(eval-after-load 'objc-mode
  (evil-leader/set-key
    "." 'find-tag
    "*" 'pop-tag-mark
    "t" 'ff-find-other-file
    "h" 'objc-headline
    ))

(require 'xcode-document-viewer)
(setq xcdoc:document-path "/Applications/Xcode.app/Contents/Developer/Documentation/DocSets/com.apple.adc.documentation.AppleiOS7.1.iOSLibrary.docset")

(setq xcdoc:open-w3m-other-buffer t)

(provide 'pelm-objc)

;;; pelm-objc.el ends here
