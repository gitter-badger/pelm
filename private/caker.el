;; private function 

(defun dos2unix (buffer)
  "Automate M-% C-q C-m RET C-q C-j RET"
  (interactive "b buffer to convert" )
  (goto-char (point-min))
  (while (search-forward (string ?\C-m) nil t)))

;; set project main directory
(setq default-directory "~/src/")
               
;; ecb defined 
(custom-set-variables
 '(ecb-layout-name "left1")
 '(ecb-layout-window-sizes (quote (("left1" (0.30 . 0.30) (0.15 . 0.35) (0.15 . 0.35) (0.30 . 0.35)))))
 )
(project-def "atl"
	     '((basedir          "~/src/android/t4l")
	       (src-patterns     ("*.java" "*.xml"))
	       (ignore-patterns  (".git" "*.class" "*.wsdl"))
	       (tags-file        "~/src/android/t4l/TAGS")
	       (file-list-cache  "~/.t4l")
	       (open-files-cache "~/.t4l/open-files")
	       (vcs              git)
	       (compile-cmd      "ant")
	       (ack-args         "--java --xml")
	       (shutdown-hook    nil)))


;; android configurations
(add-hook 'gud-mode-hook
	  (lambda ()
            (add-to-list 'gud-jdb-classpath "~/Library/android-sdk-mac_x86/platforms/android-8/android.jar ")
	    )
)

(custom-set-variables
  '(android-mode-avd "version2.2")
  '(android-mode-sdk-dir "~/Library/android-sdk-mac_x86")

)

;; jabber start 
(setq jabber-account-list
      '(("eggcaker@gmail.com" 
	 (:network-server . "talk.google.com")
	 (:connection-type . ssl))))

;;(jabber-connect-all)

;;emacs  server start
(server-start)
