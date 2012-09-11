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
(setq  mu4e-maildir "/Users/eggcaker/.gmail"
       mu4e-sent-folder   "/[Gmail].Sent Mail"
       mu4e-drafts-folder  "/[Gmail].Drafts" 
       mu4e-trash-folder  "/[Gmail].Trash"  
       mu4e-maildir-shortcuts '(
                                ("/INBOX"       . ?i)
                                ("/orgmode"        . ?o)
                                ("/[Gmail].Important"        . ?I))

       ;;
       mu4e-get-mail-command "offlineimap"
       ;; tell message-mode how to send mail
       message-send-mail-function 'smtpmail-send-it
       ;; if our mail server lives at smtp.example.org; if you have a local
       ;; mail-server, simply use 'localhost' here.
       smtpmail-smtp-server "smtp.gmail.com"
       ;; don't save messages to Sent Messages, Gmail/IMAP will take care of this
       org-mu4e-convert-to-html t
       mu4e-sent-messages-behavior 'trash)

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

(provide 'pelm-mail)
;;; pelm-mail.el ends here
