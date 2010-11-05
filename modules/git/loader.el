;; load git-emacs
(require 'git-emacs)

(defun run-gitx()
  "Run gitx..."
  (interactive)
  (shell-command "gitx")
  )


(define-key global-map  "\C-cx" 'run-gitx)



