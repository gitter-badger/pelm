; php-mode configurations

(require 'php-mode)
(setq auto-mode-alist
      (append
       '(("\\.php$" . php-mode)
	 ("\\.inc$" . php-mode))  auto-mode-alist  ))

(defun php-lint ()
  "Performs a PHP lint-check on the current file."
  (interactive)
  (compile (concat "php -l -f \"" (buffer-file-name) "\"")))

(define-key php-mode-map "\C-cv" 'php-lint)