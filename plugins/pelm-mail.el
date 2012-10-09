;;; pelm-mail.el --- PELM mail setup for mu4e
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:


(require 'mu4e)
(require 'org-mu4e)

(define-key pelm-keymap "m" 'mu4e)


(setq mu4e-mu-binary "/usr/local/bin/mu")
(setq  mu4e-maildir "/Users/eggcaker/.mail"
       mu4e-sent-folder   "/[Gmail].Sent Mail"
       mu4e-drafts-folder  "/[Gmail].Drafts" 
       mu4e-trash-folder  "/[Gmail].Trash"  
       mu4e-maildir-shortcuts '(
                                ("/INBOX"       . ?i)
                                ("/orgmode"        . ?O)
                                ("/[Gmail].Important"        . ?I))

       ;;
       mu4e-get-mail-command "offlineimap"
       org-mu4e-convert-to-html t
       ;; don't save messages to Sent Messages, Gmail/IMAP will take care of this
       mu4e-sent-messages-behavior 'trash)

;;send mail
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)
     
     ;; don't keep message buffers around
     (setq message-kill-buffer-on-exit t)

(setq mu4e-org-contacts-file  "~/.org-files/contacts.org")
(add-to-list 'mu4e-headers-actions
             '("org-contact-add" . mu4e-action-add-org-contact) t)
(add-to-list 'mu4e-view-actions
             '("org-contact-add" . mu4e-action-add-org-contact) t)
 (require 'gnus-dired)
;; make the `gnus-dired-mail-buffers' function also work on message-mode derived
;; modes, such as mu4e-compose-mode
(defun gnus-dired-mail-buffers ()
  "Return a list of active message buffers."
  (let (buffers)
    (save-current-buffer
      (dolist (buffer (buffer-list t))
     	(set-buffer buffer)
     	(when (and (derived-mode-p 'message-mode)
                   (null message-sent-message-via))
     	  (push (buffer-name buffer) buffers))))
    (nreverse buffers)))

(setq gnus-dired-mail-mode 'mu4e-user-agent)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

;(setq mu4e-bookmarks '(("flag:unread AND NOT flag:trashed AND NOT 
;  maildir:/[Gmail].Sent AND NOT maildir:/[Gmail].Spam" "Unread messages" ?u))) 

(setq  mu4e-view-prefer-html t)
(setq mail-user-agent 'mu4e-user-agent)

;; something about ourselves
(setq
 user-mail-address "eggcaker@gmail.com"
 user-full-name  "Tongzhu Zhang"
 message-signature
 (concat
  "Tongzhu Zhang\n"
  "http://caker.me\n"))

(setq message-kill-buffer-on-exit t)
(setq mu4e-html2text-command "w3m -dump -T text/html")
(setq w3m-command "/usr/local/bin/w3m")

;; password encrypt 
(require 'epa-file)
(require 'netrc)
(require 'offlineimap)
(setq smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg"))

(defun pelm-get-password (host port)
  (interactive)
  (let* ((netrc (netrc-parse (expand-file-name "~/.authinfo.gpg")))
         (hostentry (netrc-machine netrc host port port)))
    (when hostentry (netrc-get hostentry "password"))))


(provide 'pelm-mail)
;;; pelm-mail.el ends here
