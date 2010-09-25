; php-mode configurations

(require 'php-mode)
(setq auto-mode-alist
      (append
       '(("\\.php$" . php-mode)
      ("\\.inc$" . php-mode))  auto-mode-alist  ))

(defun check-php-syntax()
  "Performs a PHP syntax on the current file."
  (interactive)
  (compile (concat "php -l -f \"" (buffer-file-name) "\"")))

(define-key php-mode-map "\C-cv" 'check-php-syntax)

(defun run-php()
  "Run a PHP script "
  (interactive)
  (compile (concat "php \"" (buffer-file-name) "\"")))

(define-key php-mode-map "\C-cr" 'run-php)


