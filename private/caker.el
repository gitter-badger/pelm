;; private function 

(defun dos2unix (buffer)
  "Automate M-% C-q C-m RET C-q C-j RET"
  (interactive "b buffer to convert" )
  (goto-char (point-min))
  (while (search-forward (string ?\C-m) nil t)))

(global-set-key (kbd "C-x p")
                (lambda ()
                  (interactive)
                  (comint-send-string (inferior-moz-process)
                                      "BrowserReload();")))


;; set project main directory
(setq default-directory "~/src/brayma/")
               
;; ecb defined 
(custom-set-variables
 '(ecb-layout-name "left1")
 '(ecb-layout-window-sizes (quote (("left1" (0.3076923076923077 . 0.29545454545454547) (0.14102564102564102 . 0.3409090909090909) (0.16666666666666666 . 0.3409090909090909) (0.3076923076923077 . 0.3409090909090909)))))
 '(ecb-source-path (quote (
			   ("~/src/brayma" "brayma")
			   ))))
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

;;emacs  server start
(server-start)
