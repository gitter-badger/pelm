
;; android loader
(require 'android-mode)
(require 'android)

(defun find_package_for_class (start end) 
      "Find the package for for the class which in the reginon."
    ;  (interactive "r")
;      (setq cn (start end))
 ;     (message "find package")
  ;   (compile (concat "~/.bin/fp \"" 'cn "\"")))
)
  
     (define-key java-mode-map (kbd "C-c f") 'find_package_for_class)
