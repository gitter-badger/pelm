
(org-remember-insinuate)
(setq org-directory "~/.org-files")
(define-key global-map "\C-cr" 'org-remember)
(setq org-agenda-files (file-expand-wildcards "~/.org-files/*.org"))
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-remember-templates
'(
   ("Todo" ?t "* TODO %?\n %i\n %a" "~/.org-files/todo.org" "Tasks")
   ("Notes" ?j "* %U %?\n\n %i\n %a" "~/.org-files/notes.org")
   ("Idea" ?i "* %^{Title}\n %i\n %a" "~/.org-files/ideas.org" "New Ideas")
 ))

;; active Babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sh . t)
     (js . t)
     (ditaa . t)
     (R . t)
;     (python . t) 
     ))
