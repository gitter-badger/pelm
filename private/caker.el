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

                            (project-def "backend"
                                 '((basedir          "~/src/brayma/backend/")
                                   (src-patterns     ("*.php" "*.sql"))
                                   (ignore-patterns  (".svn" "docs"))
                                   (tags-file        "/Users/eggcaker/src/brayma/backend/TAGS.emacs")
                                   (file-list-cache  "/Users/eggcaker/.backend/files")
                                   (open-files-cache "/Users/eggcaker/.backend/open-files")
                                   (vcs              svn)
                                   (ack-args         "--php")
                                   (shutdown-hook    nil)))

                            (project-def "frontend"
                                 '((basedir          "~/src/brayma/frontend")
                                   (src-patterns     ("*.php" "*.sql" "*.js" "*.html"))
                                   (ignore-patterns  (".svn" "docs"))
                                   (tags-file        "~/src/brayma/frontend/TAGS.emacs")
                                   (file-list-cache  "~/.frontend")
                                   (open-files-cache "~/.frontend/open-files")
                                   (vcs              svn)
                                   (ack-args         "--php --js --html --sql")
                                   (shutdown-hook    nil)))
                                                               
(server-start)
