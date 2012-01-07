;; customize for windows os

(defun send-region-to-boxcar (start end)
  (interactive "r")
  (let ((url-request-method "POST")
        (url-request-extra-headers `(("Content-Type" . "application/x-www-form-urlencoded")))

        (url-request-data (concat "email=b9c6b9667c5b69a559f8a1686ac35366" "&"
                                  "notification[from_screen_name]=c0rnbot" "&"
                                  "notification[message]=" (url-hexify-string (buffer-substring start end)))))
    (url-retrieve-synchronously
     "http://boxcar.io/devices/providers/AUT9tn0bdG3YK7shNmXq/notifications")))


(global-set-key "\C-ct" 'send-region-to-boxcar)







