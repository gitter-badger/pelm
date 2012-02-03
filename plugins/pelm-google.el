;;; pelm-ac.el --- PELM google stuff
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm
;; Version: 0.5.0

;; This file is not part of GNU Emacs

;;; Code:

(require 'google-contacts)




;n or p to go the next or previous record;
;g to refresh the result, bypassing the cache;
;m to send an e-mail to a contact;
;s to make a new search;
;q to quit.


(require 'google-contacts-gnus)
(require 'google-contacts-message)


(setq gnus-ignored-newsgroups "")

(provide 'pelm-google)

;;; pelm-google.el ends here
