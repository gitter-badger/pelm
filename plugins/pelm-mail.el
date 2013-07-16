;;; pelm-mail.el --- PELM mail setup for gnus
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://iemacs.com/pelm


;; This file is not part of GNU Emacs

;;; Code:

;; something about me 
(setq
 user-mail-address "eggcaker@gmail.com"
 user-full-name  "Tongzhu Zhang"
 message-signature
 (concat
  "Tongzhu Zhang\n"
  "http://iemacs.com\n"))

(load-library "smtpmail")


; send mail 
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "eggcaker@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "iemacs.com"
)

(setq w3m-command "w3m")

(provide 'pelm-mail)
;;; pelm-mail.el ends here
