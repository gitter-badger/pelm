;;; android.el  some function for android development


(defun dit-root() 
  "Look for Androidmanifest.xml file to find project root of android application."
  (locate-dominating-file default-directory "AndroidManifest.xml"))



(defmacro dit-in-root (body)
  `(let ((default-directory (dit-root)))
     ,body))


(defun dit ()
  "run mvn command and install the dit app"
  (interactive)
  (dit-in-root
  (compile "dit")))

(define-key android-mode-map "\C-cm" 'dit)


