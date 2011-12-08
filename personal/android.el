;;; android.el  some function for android development


(defun dit ()
  "run mvn command and install the dit app"
  (interactive)
  (compile "dit"))

(define-key android-mode-map "\C-cm" 'dit)


