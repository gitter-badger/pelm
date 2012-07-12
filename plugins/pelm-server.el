;;; pelm-server.el --- PELM  emacs server
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

;; emacs server start
;; only started when running on GUI emacs
(if window-system
    (server-start))

(provide 'pelm-server)

;;perlm-server.el ends here
