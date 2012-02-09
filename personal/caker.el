;;; only personal stuff 
;;; maybe need ignore this file??
;;;

(setq default-directory "~/src/Android/DIT/dit-app/")

;; jabber start 
(setq jabber-account-list
      '(("eggcaker@gmail.com" 
    (:network-server . "talk.google.com")
    (:connection-type . ssl))))

;;(jabber-connect-all)


;;gnus setup
(setq gnus-invalid-group-regexp "[:`'\"]\\|^$")
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(setq gnus-summary-thread-gathering-function
      'gnus-gather-threads-by-subject)

(setq gnus-posting-styles
       '((".*"
          (name "Tongzhu Zhang")
          (User-Agent "Emacs+gnus")
          (signature "Tongzhu Zhang\n http://caker.me\n")
          ("X-URL" "http://caker.me")
          )))

(setq gnus-inhibit-startup-message t)

(setq nnimap-split-inbox '("INBOX"))
(setq nnimap-split-rule 'nnmail-split-fancy)
(setq gnus-parameters
      '(("nnimap+imap.gmail.com.*" (gcc-self . t))))
(setq gnus-fetch-old-headers t) 

(eval-after-load "mm-decode" 
'(progn 
(add-to-list 'mm-discouraged-alternatives "text/html") 
(add-to-list 'mm-discouraged-alternatives "text/richtext"))) 


(setq user-full-name "Tongzhu Zhang")
(setq user-mail-address "eggcaker@gmail.com")
(setq send-mail-function 'smtpmail-send-it)

;; standard way of getting imap going
(setq gnus-select-method 
         '(nnimap "gmail"
          (nnimap-address "imap.gmail.com")
          (nnimap-server-port 993)
          (nnimap-stream ssl)))

(setq gnus-permanently-visible-groups "mail")


;; Configure outbound mail (SMTP)
(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-default-smtp-server "smtp.gmail.com"
      send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587
      smtpmail-auth-credentials '(("smtp.gmail.com"
				   587
				   "eggcaker@gmail.com"
				   nil)))

(require 'w3m)
(setq gnus-mime-display-multipart-related-as-mixed nil)
(setq mm-text-html-renderer 'w3m)
(setq mm-inline-text-html-with-images t)
(setq mm-inline-text-html-with-w3m-keymap nil)
