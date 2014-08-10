;; pelm-server.el --- PELM  emacs server
;;
;;; Commentary:
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

;; emacs server start
;; only started when running on GUI emacs
(require 'server)
(if window-system
    (unless (server-running-p)
      (server-start)
   ))


(provide 'pelm-server)
;;; pelm-server.el ends here
