;;; pelm-mail.el --- PELM setup for gnus
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://iemacs.com/pelm


;; This file is not part of GNU Emacs

;;; Code:


(setq gnus-select-method '(nntp "localhost"))

(setq gnus-secondary-select-methods
      '((nnimap "gmail"
                 (nnimap-address "localhost")
                 (nnimap-stream network)
                 (nnimap-authenticator login))
))




(setq gnus-ignored-from-addresses "eggcaker@gmail.com")


(add-hook 'message-mode-hook
          (lambda ()
            (setq fill-column 72)
            (turn-on-auto-fill)))
(setq gnus-posting-styles
      '((".*"
         (name "Eggcaker")
         (address "eggcaker@nomail.net")
         (User-Agent "Emacs+gnus")
         (signature "eggcaker\n Ubuntu+Emacs+Gnus\n"))

        ((message-mail-p)
         (name"eggcaker")
         (address "eggcaker@nomail.net")
         (User-Agent "Emacs+gnus")
         (signature "eggcaker\n Ubuntu+Emacs+Gnus\n")
         )
        ))

(setq gnus-visible-headers
      "^\\(^From:\\|^Subject:\\|^Date:\\|^Followup-To:
			\\|^X-Newsreader:\\|^User-Agent:\\|^X-Mailer:
			\\|Line:\\|Lines:\\|Content-Type:\\|NNTP-Posting-Host\\)")

(gnus-add-configuration '(article (vertical 1.0
                                            (summary .40 point) (article 1.0))))

(auto-image-file-mode)

(setq gnus-confirm-mail-reply-to-news t
      message-kill-buffer-on-exit t
      message-elide-ellipsis "[...]\n"
      )


(setq gnus-summary-same-subject "")
(setq gnus-sum-thread-tree-indent "")
(setq gnus-sum-thread-tree-single-indent "")
(setq gnus-sum-thread-tree-root "●")
(setq gnus-sum-thread-tree-false-root "☆")
(setq gnus-sum-thread-tree-vertical "│")
(setq gnus-sum-thread-tree-leaf-with-other "├─►")
(setq gnus-sum-thread-tree-single-leaf "╰─►")


(setq gnus-summary-gather-subject-limit 'fuzzy)
(setq gnus-summary-line-format "%4P %U%R%z%O %{%14&user-date;%} %{%-20,20n%} %{%ua%} %B %(%I%-60,60s%)\n")

(setq gnus-user-date-format-alist             
      '(((gnus-seconds-today) . "TD %H:%M")  
        (604800 . "W%w %H:%M")              
        ((gnus-seconds-month) . "%d %H:%M") 
        ((gnus-seconds-year) . "%m-%d %H:%M")
        (t . "%y-%m-%d %H:%M")))            


;(add-hook 'gnus-article-prepare-hook 'gnus-article-date-local)
;(add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp) 
;(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)           


(gnus-add-configuration
 '(article
   (vertical 1.0
             (summary .35 point)
             (article 1.0))))

(setq
 gnus-use-trees t                                                   
 gnus-tree-minimize-window nil                                       
 gnus-fetch-old-headers 'some                                         
 gnus-generate-tree-function 'gnus-generate-horizontal-tree            
 gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject 
 )

(setq gnus-thread-sort-functions
      '(
        (not gnus-thread-sort-by-date)                            
        (not gnus-thread-sort-by-number)))                         

;(add-hook 'gnus-switch-on-after-hook 'gnus-group-first-unread-group) 
;(add-hook 'gnus-summary-exit-hook 'gnus-group-first-unread-group)   

(defun gnus-user-format-function-a (header)
  (let ((myself (concat "< eggcaker@gmail.com >"))
        (references (mail-header-references header))
        (message-id (mail-header-id header)))
    (if (or (and (stringp references)
                 (string-match myself references))
            (and (stringp message-id)
                 (string-match myself message-id)))
        "X" "│")))

(provide 'pelm-gnus)
