
(setq org-directory "~/.org-files")
(setq org-agenda-files (file-expand-wildcards "~/.org-files/*.org"))
(setq org-default-notes-file (concat org-directory "/journal.org"))

(setq org-capture-templates 
      '(("t" "Todo" entry (file+headline "~/.org-files/gtd.org" "Tasks") "* TODO %?\n %i\n %a") 
        ("j" "Journal" entry (file+datetree "~/.org-files/journal.org")  "* %?\nEntered on %U\n %i\n %a")
        ))

(define-key global-map "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)
   (js . t)
   (ditaa . t)
   (python . t) 
   ))

(setq org-log-done t)
