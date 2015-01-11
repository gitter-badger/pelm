;;; pelm-org.el --- PELM org-mode  configurations 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:


;(add-to-list 'load-path "~/.emacs.d/vendor/org-mode/lisp")
;(add-to-list 'load-path "~/.emacs.d/vendor/org-mode/contrib/lisp")

(require 'org)
;(require 'org-contacts)
(require 'ox-latex)
(require 'ox-html)
(require 'ox-md)
(require 'ox-reveal)
(require 'ox-man)
(require 'ox-beamer)
(require 'org-checklist)
(require 'org-screenshot)
(require 'org-crypt)
(require 'ob-R)
(require 'ob-java)

;; added reveal export 
(setq org-reveal-root "file:///Users/eggcaker/src/apps/reveal.js/")


(setq org-export-backends '(ascii beamer html latex md rss reveal))


(add-hook 'org-mode-hook
          '(lambda ()
             (yas-minor-mode-on)
             (auto-complete-mode)
             (org-defkey org-mode-map "\C-c[" 'undefined)
             (org-defkey org-mode-map "\C-c]" 'undefined)))

(add-to-list 'auto-mode-alist
             '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

;;; directories setup
(setq org-directory "~/.org-files"
      org-default-notes-file (concat org-directory "/inbox.org")
      org-contacts-files (list (concat org-directory "/contacts.org"))
      org-mobile-directory "~/Dropbox/org"                                                        
      org-mobile-inbox-for-pull "~/.org-files/inbox.org")

(defvar org-gtd-other-files '("~/src/personal/scrum/scrum.org"))
(setf org-agenda-files (cons "~/.org-files" org-gtd-other-files))

;;; options 
(setq org-log-done (quote time)
      org-log-into-drawer "LOGBOOK"
      org-alphabetical-lists t
      org-src-fontify-natively t
      org-use-fast-todo-selection t
      org-treat-S-cursor-todo-selection-as-state-change nil
      org-habit-graph-column 102
      org-refile-use-outline-path nil ;Stop using paths for refile targets - we file directly with IDO
      org-outline-path-complete-in-steps nil
      org-refile-allow-creating-parent-nodes (quote confirm) ;
      org-completion-use-ido t
      ido-everywhere t
      ;; Keep tasks with dates on the global todo lists
      org-agenda-todo-ignore-with-date nil
      ;; Keep tasks with deadlines on the global todo lists
      org-agenda-todo-ignore-deadlines nil
      ;; Keep tasks with scheduled dates on the global todo lists
      org-agenda-todo-ignore-scheduled nil
      ;; Keep tasks with timestamps on the global todo lists
      org-agenda-todo-ignore-timestamp nil
      ;; Remove completed deadline tasks from the agenda view
      org-agenda-skip-deadline-if-done t
      ;; Remove completed scheduled tasks from the agenda view
      org-agenda-skip-scheduled-if-done t
      ;; Remove completed items from search results
      org-agenda-skip-timestamp-if-done t
      org-remove-highlights-with-change nil
      org-tags-match-list-sublevels t
      org-agenda-persistent-filter t
      org-agenda-skip-additional-timestamps-same-entry t
      org-clone-delete-id t
      org-agenda-window-setup 'current-window
      org-enable-priority-commands nil
      org-src-preserve-indentation nil
      org-tags-exclude-from-inheritance (quote ("crypt"))
      org-startup-folded 'content
      ido-max-directory-size 100000
      org-list-demote-modify-bullet (quote (("+" . "-")
                                            ("*" . "-")
                                            ("1." . "-")
                                            ("1)" . "-")))
      org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

;; Use IDO for both buffer and file completion and ido-everywhere to t
(ido-mode (quote both))

(setq ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-ignore-buffers
      '("\\` " "^\\*ESS\\*" "^\\*Messages\\*" "^\\*Help\\*" "^\\*Buffer"
              "^\\*.*Completions\\*$" "^\\*Ediff" "^\\*tramp" "^\\*cvs-"
              "_region_" " output\\*$" "^TAGS$" "^\*Ido")
      ido-ignore-directories
      '("\\`auto/" "\\.prv/" "\\`CVS/" "\\`\\.\\./" "\\`\\./" "\\.git/")
      ido-ignore-files
      '("\\`auto/" "\\.prv/" "_region_" "\\`CVS/" "\\`#" "\\`.#" "\\.DS_Store"
        "\\`\\.\\./" "\\`\\./"))

;;; TODO keywords 
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" )))

      org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("STARTED" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)))
      ;; state change trigger
      org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING" . t) ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("STARTED" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))


;;; capture template
(setq org-capture-templates
      (quote (("t" "Toto" entry (file (concat org-directory "/inbox.org"))
               "* TODO %?\n%U\n %a\n " :clock-in t :clock-resume t)
              ("x" "CLI TODO" entry
                (file (concat org-directory "/inbox.org"))
                "* TODO %i\n%U" :immediate-finish t)
              ("c" "Contacts" entry (file "~/.org-files/contacts.org")
               "* %(org-contacts-template-name)
 :PROPERTIES:
 :EMAIL: %(org-contacts-template-email)
 :PHONE:
 :ALIAS:
 :NICKNAME:
 :IGNORE:
 :ICON:
 :NOTE:
 :ADDRESS:
 :BIRTHDAY:
 :END:")
)))

;; Custom Key Bindings
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cr" 'org-capture)
(define-key global-map "\C-cl" 'org-store-link)
(global-set-key (kbd "<f12>") 'org-agenda)

(global-set-key (kbd "<f9> <f9>") 'pelm/show-org-agenda)
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> f") 'boxquote-insert-file)
(global-set-key (kbd "<f9> g") 'gnus)
(global-set-key (kbd "<f9> h") 'pelm/hide-other)
(global-set-key (kbd "<f9> n") 'org-narrow-to-subtree)
(global-set-key (kbd "<f9> w") 'widen)
(global-set-key (kbd "<f9> u") 'pelm/narrow-up-one-level)

(global-set-key (kbd "<f9> I") 'pelm/punch-in)
(global-set-key (kbd "<f9> O") 'pelm/punch-out)

(global-set-key (kbd "<f9> r") 'boxquote-region)
(global-set-key (kbd "<f9> s") 'pelm/switch-to-scratch)

(global-set-key (kbd "<f9> t") 'pelm/insert-inactive-timestamp)
(global-set-key (kbd "<f9> T") 'tabify)
(global-set-key (kbd "<f9> U") 'untabify)

(global-set-key (kbd "<f9> v") 'visible-mode)
(global-set-key (kbd "<f9> SPC") 'pelm/clock-in-last-task)
(global-set-key (kbd "C-<f9>") 'previous-buffer)
(global-set-key (kbd "M-<f9>") 'org-display-inline-images)
(global-set-key (kbd "C-x n r") 'narrow-to-region)
(global-set-key (kbd "C-s-<f12>") 'pelm/save-then-publish)
(global-set-key (kbd "C-M-r") 'org-capture)



; Enable habit tracking (and a bunch of other modules)
(setq org-modules (quote (org-bbdb
                          org-bibtex
                          org-crypt
                          org-gnus
                          org-id
                          org-info
                          org-jsinfo
                          org-habit
                          org-inlinetask
                          org-irc
                          org-mew
                          org-mhe
                          org-protocol
                          org-rmail
                          org-vm
                          org-wl
                          org-w3m)))



;; Remove empty LOGBOOK drawers on clock out
(defun pelm/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

(add-hook 'org-clock-out-hook 'pelm/remove-empty-drawer-on-clock-out 'append)




;;;; Refile settings
; Exclude DONE state tasks from refile targets
(defun pelm/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'pelm/verify-refile-target)

(setq org-agenda-dim-blocked-tasks t)

;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (
              ("h" "Habits" tags-todo "STYLE=\"habit\""
               ((org-agenda-overriding-header "Habits")
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              (" " "Agenda"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Tasks to Refile")
                       (org-tags-match-list-sublevels nil)))
                (tags-todo "-CANCELLED/!"
                           ((org-agenda-overriding-header "Stuck Projects")
                            ;(org-tags-match-list-sublevels 'indented)
                            (org-agenda-skip-function 'pelm/skip-non-stuck-projects)))
                (tags-todo "-STARTED"
                           ((org-agenda-overriding-header "Next Tasks")
                            (org-agenda-skip-function 'pelm/skip-projects-and-habits-and-single-tasks)
                            (org-agenda-todo-ignore-scheduled t)
                            (org-agenda-todo-ignore-deadlines t)
                            (org-tags-match-list-sublevels t)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))
                (tags-todo "-REFILE-CANCELLED/!-HOLD-WAITING"
                           ((org-agenda-overriding-header "Tasks")
                            (org-agenda-skip-function 'pelm/skip-project-tasks-maybe)
                            (org-agenda-todo-ignore-scheduled t)
                            (org-agenda-todo-ignore-deadlines t)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED/!"
                           ((org-agenda-overriding-header "Projects")
                            (org-agenda-skip-function 'pelm/skip-non-projects)
                            (org-agenda-todo-ignore-scheduled 'future)
                            (org-agenda-todo-ignore-deadlines 'future)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED/!WAITING|HOLD"
                           ((org-agenda-overriding-header "Waiting and Postponed Tasks")
                            (org-agenda-skip-function 'pelm/skip-stuck-projects)
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled 'future)
                            (org-agenda-todo-ignore-deadlines 'future)))
                (tags "-ARCHIVE/"
                      ((org-agenda-overriding-header "Tasks to Archive")
                       (org-agenda-skip-function 'pelm/skip-non-archivable-tasks))))
               nil)
              ("r" "Tasks to Refile" tags "REFILE"
               ((org-agenda-overriding-header "Tasks to Refile")
                (org-tags-match-list-sublevels nil)))
              ("#" "Stuck Projects" tags-todo "-CANCELLED/!"
               ((org-agenda-overriding-header "Stuck Projects")
                (org-agenda-skip-function 'pelm/skip-non-stuck-projects)))
              ("n" "Next Tasks" tags-todo "-WAITING-CANCELLED/!STARTED"
               ((org-agenda-overriding-header "Next Tasks")
                (org-agenda-skip-function 'pelm/skip-projects-and-habits-and-single-tasks)
                (org-agenda-todo-ignore-scheduled t)
                (org-agenda-todo-ignore-deadlines t)
                (org-tags-match-list-sublevels t)
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              ("R" "Tasks" tags-todo "-REFILE-CANCELLED/!-HOLD-WAITING"
               ((org-agenda-overriding-header "Tasks")
                (org-agenda-skip-function 'pelm/skip-project-tasks-maybe)
                (org-agenda-sorting-strategy
                 '(category-keep))))
              ("p" "Projects" tags-todo "-CANCELLED/!"
               ((org-agenda-overriding-header "Projects")
                (org-agenda-skip-function 'pelm/skip-non-projects)
                (org-agenda-todo-ignore-scheduled 'future)
                (org-agenda-todo-ignore-deadlines 'future)
                (org-agenda-sorting-strategy
                 '(category-keep))))
              ("w" "Waiting Tasks" tags-todo "-CANCELLED/!WAITING|HOLD"
               ((org-agenda-overriding-header "Waiting and Postponed tasks"))
               (org-agenda-skip-function 'pelm/skip-projects-and-habits)
               (org-agenda-todo-ignore-scheduled 'future)
               (org-agenda-todo-ignore-deadlines 'future))
              ("A" "Tasks to Archive" tags "-ARCHIVE/"
               ((org-agenda-overriding-header "Tasks to Archive")
                (org-agenda-skip-function 'pelm/skip-non-archivable-tasks))))))

(defun pelm/skip-stuck-projects ()

  "Skip trees that are not stuck projects"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (if (pelm/is-project-p)
          (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                 (has-next ))
            (save-excursion
              (forward-line 1)
              (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ STARTED " subtree-end t))
                (unless (member "WAITING" (org-get-tags-at))
                  (setq has-next t))))
            (if has-next
                nil
              next-headline)) ; a stuck project, has subtasks but no next task
        nil))))


(defun pelm/org-auto-exclude-function (tag)
  "Automatic task exclusion in the agenda with / RET"
  (and (cond
        (
         (string= tag "hold") t)
        )
       (concat "-" tag)))

(setq org-agenda-auto-exclude-function 'pelm/org-auto-exclude-function)



 (defun pelm/hide-other ()
    (interactive)
    (save-excursion
      (org-back-to-heading 'invisible-ok)
      (org-shifttab)
      (org-reveal)
      (org-cycle)))
  
  (defun pelm/set-truncate-lines ()
    "Toggle value of truncate-lines and refresh window display."
    (interactive)
    (setq truncate-lines (not truncate-lines))
    ;; now refresh window display (an idiom from simple.el):
    (save-excursion
      (set-window-start (selected-window)
                        (window-start (selected-window)))))
  
(defun pelm/org-auto-exclude-function (tag)
  "Automatic task exclusion in the agenda with / RET"
  (and (cond
        ((string= tag "hold")         t)
        )
       (concat "-" tag)))

(setq org-agenda-auto-exclude-function 'pelm/org-auto-exclude-function)


;;
;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)
;;
;; Show lot sof clocking history so it's easy to pick items off the C-F11 list
(setq org-clock-history-length 36)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Change tasks to STARTED when clocking in
(setq org-clock-in-switch-to-state 'pelm/clock-in-to-next)
;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
;; Save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)
;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)
;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)
;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)

(setq pelm/keep-clock-running nil)

(defun pelm/clock-in-to-next (kw)
  "Switch a task from TODO to STARTED when clocking in.
Skips capture tasks, projects, and subprojects.
Switch projects and subprojects from STARTED back to TODO"
  (when (not (and (boundp 'org-capture-mode) org-capture-mode))
    (cond
     ((and (member (org-get-todo-state) (list "TODO"))
           (pelm/is-task-p))
      "STARTED")
     ((and (member (org-get-todo-state) (list "STARTED"))
           (pelm/is-project-p))
      "TODO"))))

(defun pelm/find-project-task ()
  "Move point to the parent (project) task if any"
  (save-restriction
    (widen)
    (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
      (while (org-up-heading-safe)
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq parent-task (point))))
      (goto-char parent-task)
      parent-task)))

(defun pelm/punch-in (arg)
  "Start continuous clocking and set the default task to the
selected task.  If no task is selected set the Organization task
as the default task."
  (interactive "p")
  (setq pelm/keep-clock-running t)
  (if (equal major-mode 'org-agenda-mode)
      ;;
      ;; We're in the agenda
      ;;
      (let* ((marker (org-get-at-bol 'org-hd-marker))
             (tags (org-with-point-at marker (org-get-tags-at))))
        (if (and (eq arg 4) tags)
            (org-agenda-clock-in '(16))
          (pelm/clock-in-organization-task-as-default)))
    ;;
    ;; We are not in the agenda
    ;;
    (save-restriction
      (widen)
      ; Find the tags on the current task
      (if (and (equal major-mode 'org-mode) (not (org-before-first-heading-p)) (eq arg 4))
          (org-clock-in '(16))
        (pelm/clock-in-organization-task-as-default)))))

(defun pelm/punch-out ()
  (interactive)
  (setq pelm/keep-clock-running nil)
  (when (org-clock-is-active)
    (org-clock-out))
  (org-agenda-remove-restriction-lock))

(defun pelm/clock-in-default-task ()
  (save-excursion
    (org-with-point-at org-clock-default-task
      (org-clock-in))))

(defun pelm/clock-in-parent-task ()
  "Move point to the parent (project) task if any and clock in"
  (let ((parent-task))
    (save-excursion
      (save-restriction
        (widen)
        (while (and (not parent-task) (org-up-heading-safe))
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq parent-task (point))))
        (if parent-task
            (org-with-point-at parent-task
              (org-clock-in))
          (when pelm/keep-clock-running
            (pelm/clock-in-default-task)))))))


(defun pelm-clock-in-task-by-id (task-id)
  (interactive)
  (org-with-point-at (org-id-find task-id 'marker)
    (org-clock-in '(16))))

(defun pelm/clock-out-maybe ()
  (when (and pelm/keep-clock-running
             (not org-clock-clocking-in)
             (marker-buffer org-clock-default-task)
             (not org-clock-resolving-clocks-due-to-idleness))
    (pelm/clock-in-parent-task)))

(add-hook 'org-clock-out-hook 'pelm/clock-out-maybe 'append)

(require 'org-id)
(defun pelm/clock-in-task-by-id (id)
  "Clock in a task by id"
  (org-with-point-at (org-id-find id 'marker)
    (org-clock-in nil)))



(defun pelm/clock-in-last-task (arg)
  "Clock in the interrupted task if there is one
Skip the default task and get the next one.
A prefix arg forces clock in of the default task."
  (interactive "p")
  (let ((clock-in-to-task
         (cond
          ((eq arg 4) org-clock-default-task)
          ((and (org-clock-is-active)
                (equal org-clock-default-task (cadr org-clock-history)))
           (caddr org-clock-history))
          ((org-clock-is-active) (cadr org-clock-history))
          ((equal org-clock-default-task (car org-clock-history)) (cadr org-clock-history))
          (t (car org-clock-history)))))
    (org-with-point-at clock-in-to-task
      (org-clock-in nil))))


(defun pelm/is-project-p ()
  "Any task with a todo keyword subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task has-subtask))))

(defun pelm/is-project-subtree-p ()
  "Any task with a todo keyword that is in a project subtree.
Callers of this function already widen the buffer view."
  (let ((task (save-excursion (org-back-to-heading 'invisible-ok)
                              (point))))
    (save-excursion
      (pelm/find-project-task)
      (if (equal (point) task)
          nil
        t))))

(defun pelm/is-task-p ()
  "Any task with a todo keyword and no subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task (not has-subtask)))))

(defun pelm/is-subproject-p ()
  "Any task which is a subtask of another project"
  (let ((is-subproject)
        (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
    (save-excursion
      (while (and (not is-subproject) (org-up-heading-safe))
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq is-subproject t))))
    (and is-a-task is-subproject)))

(defun pelm/list-sublevels-for-projects-indented ()
  "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
  This is normally used by skipping functions where this variable is already local to the agenda."
  (if (marker-buffer org-agenda-restrict-begin)
      (setq org-tags-match-list-sublevels 'indented)
    (setq org-tags-match-list-sublevels nil))
  nil)

(defun pelm/list-sublevels-for-projects ()
  "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
  This is normally used by skipping functions where this variable is already local to the agenda."
  (if (marker-buffer org-agenda-restrict-begin)
      (setq org-tags-match-list-sublevels t)
    (setq org-tags-match-list-sublevels nil))
  nil)

(defun pelm/skip-non-stuck-projects ()
  "Skip trees that are not stuck projects"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (if (pelm/is-project-p)
          (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                 (has-next (save-excursion
                             (forward-line 1)
                             (and (< (point) subtree-end)
                                  (re-search-forward "^\\*+ \\(STARTED\\) " subtree-end t)))))
            (if has-next
                next-headline
              nil)) ; a stuck project, has subtasks but no next task
        next-headline))))

(defun pelm/skip-non-projects ()
  "Skip trees that are not projects"
  (pelm/list-sublevels-for-projects-indented)
  (if (save-excursion (pelm/skip-non-stuck-projects))
      (save-restriction
        (widen)
        (let ((subtree-end (save-excursion (org-end-of-subtree t))))
          (if (pelm/is-project-p)
              nil
            subtree-end)))
    (org-end-of-subtree t)))

(defun pelm/skip-project-trees-and-habits ()
  "Skip trees that are projects"
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((pelm/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       (t
        nil)))))

(defun pelm/skip-projects-and-habits-and-single-tasks ()
  "Skip trees that are projects, tasks that are habits, single non-project tasks"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (cond
       ((org-is-habit-p)
        next-headline)
       ((pelm/is-project-p)
        next-headline)
       ((and (pelm/is-task-p) (not (pelm/is-project-subtree-p)))
        next-headline)
       (t
        nil)))))

(defun pelm/skip-project-tasks-maybe ()
  "Show tasks related to the current restriction.
When restricted to a project, skip project and sub project tasks, habits, STARTED tasks, and loose tasks.
When not restricted, skip project and sub-project tasks, habits, and project related tasks."
  (save-restriction
    (widen)
    (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
           (next-headline (save-excursion (or (outline-next-heading) (point-max))))
           (limit-to-project (marker-buffer org-agenda-restrict-begin)))
      (cond
       ((pelm/is-project-p)
        next-headline)
       ((org-is-habit-p)
        subtree-end)
       ((and (not limit-to-project)
             (pelm/is-project-subtree-p))
        subtree-end)
       ((and limit-to-project
             (pelm/is-project-subtree-p)
             (member (org-get-todo-state) (list "STARTED")))
        subtree-end)
       (t
        nil)))))

(defun pelm/skip-projects-and-habits ()
  "Skip trees that are projects and tasks that are habits"
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((pelm/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       (t
        nil)))))

(defun pelm/skip-non-subprojects ()
  "Skip trees that are not projects"
  (let ((next-headline (save-excursion (outline-next-heading))))
    (if (pelm/is-subproject-p)
        nil
      next-headline)))

;; shows 1 minute clocking gaps
(setq org-agenda-clock-consistency-checks
      (quote (:max-duration "10:30"
              :min-duration 0
              :max-gap 0
              :gap-ok-around ("10:30"))))

(setq org-time-stamp-rounding-minutes (quote (1 1)))

;;uuid
(setq org-id-method (quote uuidgen))


;;; communiate with shell command 
;;; create a task with uuid 
;;; shell command like 
;; emacsclient -e '(ec/clock-in-dit-task)'
;; # do some stuff here
;; emacsclient -e '(ec/resume-clock)'
;;;
(defun ec/clock-in-dit-task ()
  (interactive)
  (pelm/clock-in-task-by-id "eb155a82-92b2-4f25-a3c6-0304591af2f9"))

(defun ec/resume-clock ()
  (interactive)
  (if (marker-buffer org-clock-interrupted-task)
      (org-with-point-at org-clock-interrupted-task
        (org-clock-in))
    (org-clock-out)))


;;removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Agenda log mode items to display (clock time only by default)
(setq org-agenda-log-mode-items (quote (clock)))


;; Agenda clock report parameters
(setq org-agenda-clockreport-parameter-plist
      (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))



; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

; global Effort estimate values
; global STYLE property values for completion
(setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                    ("STYLE_ALL" . "habit"))))



; Tags with fast selection keys
(setq org-tag-alist (quote (
                            ("PHONE" . ?p)
                            ("WAITING" . ?w)
                            ("HOLD" . ?h)
                            ("PERSONAL" . ?P)
                            ("WORK" . ?W)
                            ("ORG" . ?O)
                            ("DIT" . ?D)
                            ("NOTE" . ?n)
                            ("CANCELLED" . ?c)
                            ("FLAGGED" . ??))))

; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)
(setq org-list-indent-offset 2)
(setq org-agenda-span 'day)

(setq org-stuck-projects (quote ("" nil nil "")))


(defun pelm/is-project-p ()
  "Any task with a todo keyword subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task has-subtask))))

(defun pelm/is-project-subtree-p ()
  "Any task with a todo keyword that is in a project subtree.
Callers of this function already widen the buffer view."
  (let ((task (save-excursion (org-back-to-heading 'invisible-ok)
                              (point))))
    (save-excursion
      (pelm/find-project-task)
      (if (equal (point) task)
          nil
        t))))

(defun pelm/is-task-p ()
  "Any task with a todo keyword and no subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task (not has-subtask)))))

(defun pelm/is-subproject-p ()
  "Any task which is a subtask of another project"
  (let ((is-subproject)
        (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
    (save-excursion
      (while (and (not is-subproject) (org-up-heading-safe))
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq is-subproject t))))
    (and is-a-task is-subproject)))

(defun pelm/list-sublevels-for-projects-indented ()
  "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
  This is normally used by skipping functions where this variable is already local to the agenda."
  (if (marker-buffer org-agenda-restrict-begin)
      (setq org-tags-match-list-sublevels 'indented)
    (setq org-tags-match-list-sublevels nil))
  nil)

(defun pelm/list-sublevels-for-projects ()
  "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
  This is normally used by skipping functions where this variable is already local to the agenda."
  (if (marker-buffer org-agenda-restrict-begin)
      (setq org-tags-match-list-sublevels t)
    (setq org-tags-match-list-sublevels nil))
  nil)

(defun pelm/skip-non-stuck-projects ()
  "Skip trees that are not stuck projects"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (if (pelm/is-project-p)
          (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                 (has-next (save-excursion
                             (forward-line 1)
                             (and (< (point) subtree-end)
                                  (re-search-forward "^\\*+ \\(STARTED\\) " subtree-end t)))))
            (if has-next
                next-headline
              nil)) ; a stuck project, has subtasks but no next task
        next-headline))))

(defun pelm/skip-non-projects ()
  "Skip trees that are not projects"
  (pelm/list-sublevels-for-projects-indented)
  (if (save-excursion (pelm/skip-non-stuck-projects))
      (save-restriction
        (widen)
        (let ((subtree-end (save-excursion (org-end-of-subtree t))))
          (if (pelm/is-project-p)
              nil
            subtree-end)))
    (org-end-of-subtree t)))

(defun pelm/skip-project-trees-and-habits ()
  "Skip trees that are projects"
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((pelm/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       (t
        nil)))))

(defun pelm/skip-projects-and-habits-and-single-tasks ()
  "Skip trees that are projects, tasks that are habits, single non-project tasks"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (cond
       ((org-is-habit-p)
        next-headline)
       ((pelm/is-project-p)
        next-headline)
       ((and (pelm/is-task-p) (not (pelm/is-project-subtree-p)))
        next-headline)
       (t
        nil)))))

(defun pelm/skip-project-tasks-maybe ()
  "Show tasks related to the current restriction.
When restricted to a project, skip project and sub project tasks, habits, STARTED tasks, and loose tasks.
When not restricted, skip project and sub-project tasks, habits, and project related tasks."
  (save-restriction
    (widen)
    (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
           (next-headline (save-excursion (or (outline-next-heading) (point-max))))
           (limit-to-project (marker-buffer org-agenda-restrict-begin)))
      (cond
       ((pelm/is-project-p)
        next-headline)
       ((org-is-habit-p)
        subtree-end)
       ((and (not limit-to-project)
             (pelm/is-project-subtree-p))
        subtree-end)
       ((and limit-to-project
             (pelm/is-project-subtree-p)
             (member (org-get-todo-state) (list "STARTED")))
        subtree-end)
       (t
        nil)))))

(defun pelm/skip-projects-and-habits ()
  "Skip trees that are projects and tasks that are habits"
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((pelm/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       (t
        nil)))))

(defun pelm/skip-non-subprojects ()
  "Skip trees that are not projects"
  (let ((next-headline (save-excursion (outline-next-heading))))
    (if (pelm/is-subproject-p)
        nil
      next-headline)))


(setq org-archive-mark-done nil)
(setq org-archive-location "%s_archive::* Archived Tasks")

(defun pelm/skip-non-archivable-tasks ()
  "Skip trees that are not available for archiving"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      ;; Consider only tasks with done todo headings as archivable candidates
      (if (member (org-get-todo-state) org-done-keywords)
          (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                 (daynr (string-to-int (format-time-string "%d" (current-time))))
                 (a-month-ago (* 60 60 24 (+ daynr 1)))
                 (last-month (format-time-string "%Y-%m-" (time-subtract (current-time) (seconds-to-time a-month-ago))))
                 (this-month (format-time-string "%Y-%m-" (current-time)))
                 (subtree-is-current (save-excursion
                                       (forward-line 1)
                                       (and (< (point) subtree-end)
                                            (re-search-forward (concat last-month "\\|" this-month) subtree-end t)))))
            (if subtree-is-current
                next-headline ; Has a date in this month or last month, skip it
              nil))  ; available to archive
        (or next-headline (point-max))))))


;;; babel setup
(setq org-ditaa-jar-path "~/.emacs.d/vendor/ditaa.jar")
(setq org-plantuml-jar-path "~/.emacs.d/vendor/plantuml.jar")

(add-hook 'org-babel-after-execute-hook 'pelm/display-inline-images 'append)

(defun pelm/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
 ;        (dot . t)
         (ditaa . t)
         (R . t)
         ;(ledger . t)
         ;(haskell . t)
 ;        (python . t)
         ;(ruby . t)
         (gnuplot . t)
 ;        (scala . t)
 ;        (clojure . t)
         (sh . t)
         (js . t)
         (java . t)
         (org . t)
         ;(plantuml . t)
         ;(latex . t)
         )))

; Do not prompt to confirm evaluation
; This may be dangerous - make sure you understand the consequences
; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

;;
(setq org-startup-with-inline-images nil)


;;; Reminder Setup

; Erase all reminders and rebuilt reminders for today from the agenda
(defun pelm/org-agenda-to-appt ()
  (interactive)
  (setq appt-time-msg-list nil)
  (org-agenda-to-appt))

; Rebuild the reminders everytime the agenda is displayed
(add-hook 'org-finalize-agenda-hook 'pelm/org-agenda-to-appt 'append)

; This is at the end of my .emacs - so appointments are set up when Emacs starts
(pelm/org-agenda-to-appt)

; Activate appointments so we get notifications
(appt-activate t)

;; alert time 
(setq appt-message-warning-time 2)   

; If we leave Emacs running overnight - reset the appointments one minute after midnight
(run-at-time "24:01" nil 'pelm/org-agenda-to-appt)

;; disable diary event
;(setq org-agenda-include-diary nil)
;(setq org-agenda-diary-file "~/.org-files/diary.org")

;; Include agenda archive files when searching for things
(setq org-agenda-text-search-extra-files (quote (agenda-archives)))

;; Show all future entries for repeating tasks
(setq org-agenda-repeating-timestamp-show-all t)

;; Show all agenda dates - even if they are empty
(setq org-agenda-show-all-dates t)

;; Sorting order for tasks on the agenda
(setq org-agenda-sorting-strategy
      (quote ((agenda habit-down time-up user-defined-up priority-down effort-up category-keep)
              (todo category-up priority-down effort-up)
              (tags category-up priority-down effort-up)
              (search category-up))))

;; Start the weekly agenda on Monday
(setq org-agenda-start-on-weekday 1)

;; Enable display of the time grid so we can see the marker for the current time
(setq org-agenda-time-grid (quote ((daily today remove-match)
                                   #("----------------" 0 16 (org-heading t))
                                   (830 1000 1200 1300 1500 1700))))

;; Display tags farther right
(setq org-agenda-tags-column -102)

;;
;; Agenda sorting functions
;;
(setq org-agenda-cmp-user-defined 'pelm/agenda-sort)

(defun pelm/agenda-sort (a b)
  "Sorting strategy for agenda items.
Late deadlines first, then scheduled, then non-late deadlines"
  (let (result num-a num-b)
    (cond
     ; time specific items are already sorted first by org-agenda-sorting-strategy

     ; non-deadline and non-scheduled items next
     ((pelm/agenda-sort-test 'pelm/is-not-scheduled-or-deadline a b))

     ; deadlines for today next
     ((pelm/agenda-sort-test 'pelm/is-due-deadline a b))

     ; late deadlines next
     ((pelm/agenda-sort-test-num 'pelm/is-late-deadline '< a b))

     ; scheduled items for today next
     ((pelm/agenda-sort-test 'pelm/is-scheduled-today a b))

     ; late scheduled items next
     ((pelm/agenda-sort-test-num 'pelm/is-scheduled-late '> a b))

     ; pending deadlines last
     ((pelm/agenda-sort-test-num 'pelm/is-pending-deadline '< a b))

     ; finally default to unsorted
     (t (setq result nil)))
    result))

(defmacro pelm/agenda-sort-test (fn a b)
  "Test for agenda sort"
  `(cond
    ; if both match leave them unsorted
    ((and (apply ,fn (list ,a))
          (apply ,fn (list ,b)))
     (setq result nil))
    ; if a matches put a first
    ((apply ,fn (list ,a))
     (setq result -1))
    ; otherwise if b matches put b first
    ((apply ,fn (list ,b))
     (setq result 1))
    ; if none match leave them unsorted
    (t nil)))

(defmacro pelm/agenda-sort-test-num (fn compfn a b)
  `(cond
    ((apply ,fn (list ,a))
     (setq num-a (string-to-number (match-string 1 ,a)))
     (if (apply ,fn (list ,b))
         (progn
           (setq num-b (string-to-number (match-string 1 ,b)))
           (setq result (if (apply ,compfn (list num-a num-b))
                            -1
                          1)))
       (setq result -1)))
    ((apply ,fn (list ,b))
     (setq result 1))
    (t nil)))

(defun pelm/is-not-scheduled-or-deadline (date-str)
  (and (not (pelm/is-deadline date-str))
       (not (pelm/is-scheduled date-str))))

(defun pelm/is-due-deadline (date-str)
  (string-match "Deadline:" date-str))


(defun pelm/is-late-deadline (date-str)
  (string-match "In *\\(-.*\\)d\.:" date-str))

(defun pelm/is-pending-deadline (date-str)
  (string-match "In \\([^-]*\\)d\.:" date-str))

(defun pelm/is-deadline (date-str)
  (or (pelm/is-due-deadline date-str)
      (pelm/is-late-deadline date-str)
      (pelm/is-pending-deadline date-str)))

(defun pelm/is-scheduled (date-str)
  (or (pelm/is-scheduled-today date-str)
      (pelm/is-scheduled-late date-str)))

(defun pelm/is-scheduled-today (date-str)
  (string-match "Scheduled:" date-str))

(defun pelm/is-scheduled-late (date-str)
  (string-match "Sched\.\\(.*\\)x:" date-str))

;; disable q key
(add-hook 'org-agenda-mode-hook
          (lambda ()
            (define-key org-agenda-mode-map "q" 'bury-buffer))
          'append)

(setq org-hide-leading-stars nil)

(setq org-enforce-todo-dependencies t)

;; TODO try and remove if I don't like it 
(setq org-startup-indented t)

(setq org-cycle-separator-lines 1)

(setq org-blank-before-new-entry (quote ((heading)
                                         (plain-list-item ))))

(setq org-reverse-note-order nil)
(setq org-deadline-warning-days 30)
(setq org-table-export-default-format "orgtbl-to-csv")
(setq org-show-following-heading t)
(setq org-show-hierarchy-above t)
(setq org-habit-following-days 30) 
(setq org-show-siblings (quote ((default))))
(run-at-time "06:00" 86400 '(lambda () (setq org-habit-show-habits t)))
(setq global-auto-revert-mode t)
(setq org-crypt-disable-auto-save nil)
(setq org-special-ctrl-a/e 'reversed)
(setq org-special-ctrl-k t)
(setq org-yank-adjusted-subtrees t)

;;;speed command 
(setq org-use-speed-commands t)
(setq org-speed-commands-user (quote (("0" . ignore)
                                      ("1" . ignore)
                                      ("2" . ignore)
                                      ("3" . ignore)
                                      ("4" . ignore)
                                      ("5" . ignore)
                                      ("6" . ignore)
                                      ("7" . ignore)
                                      ("8" . ignore)
                                      ("9" . ignore)

                                      ("a" . org-insert-subheading)
                                      ("d" . ignore)
                                      ("h" . pelm/hide-other)
                                    ;  ("g" . ignore)
                                      ("i" progn
                                       (forward-char 1)
                                       (call-interactively 'org-insert-heading-respect-content))
                                      ("k" . org-kill-note-or-show-branches)
                                      ("l" . ignore)
                                      ("m" . ignore)
                                      ("q" . pelm/show-org-agenda)
                                      ("r" . ignore)
                                      ("s" . org-save-all-org-buffers)
                                      ("w" . org-refile)
                                      ("x" . ignore)
                                      ("y" . ignore)
                                      ("z" . org-add-note)

                                      ("A" . ignore)
                                      ("B" . ignore)
                                      ("E" . ignore)
                                      ("F" . ignore)
                                      ("G" . ignore)
                                      ("H" . ignore)
                                      ("J" . org-clock-goto)
                                      ("K" . ignore)
;                                      ("L" . ignore)
                                      ("M" . ignore)
                                      ("N" . pelm/narrow-to-subtree)
                                      ("P" . pelm/narrow-to-project)
                                      ("Q" . ignore)
                                      ;("R" . ignore)
                                      ("S" . ignore)
                                      ("T" . (org-show-todo-tree nil))
                                      ("U" . pelm/narrow-up-one-level)
                                      ("V" . ignore)
                                      ("W" . pelm/widen)
                                      ("X" . ignore)
                                      ("Y" . ignore)
                                      ("Z" . ignore))))

(defun pelm/org-todo (arg)
  (interactive "p")
  (if (equal arg 4)
      (save-restriction
        (widen)
        (org-narrow-to-org-subtree)
        (org-show-todo-tree nil))
    (widen)
    (org-narrow-to-org-subtree)
    (org-show-todo-tree nil)))

(global-set-key (kbd "<S-f5>") 'pelm/widen)

(defun pelm/widen ()
  (interactive)
  (widen)
  (org-agenda-remove-restriction-lock))

(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "W" 'pelm/widen))
          'append)

(defun pelm/narrow-to-org-subtree ()
  (widen)
  (org-narrow-to-subtree)
  (save-restriction
    (org-agenda-set-restriction-lock)))

(defun pelm/narrow-to-subtree ()
  (interactive)
  (if (equal major-mode 'org-agenda-mode)
      (org-with-point-at (org-get-at-bol 'org-hd-marker)
        (pelm/narrow-to-org-subtree))
    (pelm/narrow-to-org-subtree)))

(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "N" 'pelm/narrow-to-subtree))
          'append)

(defun pelm/narrow-up-one-org-level ()
  (widen)
  (save-excursion
    (outline-up-heading 1 'invisible-ok)
    (pelm/narrow-to-org-subtree)))

(defun pelm/narrow-up-one-level ()
  (interactive)
  (if (equal major-mode 'org-agenda-mode)
      (org-with-point-at (org-get-at-bol 'org-hd-marker)
        (pelm/narrow-up-one-org-level))
    (pelm/narrow-up-one-org-level)))

(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "U" 'pelm/narrow-up-one-level))
          'append)

(defun pelm/narrow-to-org-project ()
  (widen)
  (save-excursion
    (pelm/find-project-task)
    (pelm/narrow-to-org-subtree)))

(defun pelm/narrow-to-project ()
  (interactive)
  (if (equal major-mode 'org-agenda-mode)
      (org-with-point-at (org-get-at-bol 'org-hd-marker)
        (pelm/narrow-to-org-project))
    (pelm/narrow-to-org-project)))

(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "P" 'pelm/narrow-to-project))
          'append)

(setq org-show-entry-below (quote ((default))))

(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "\C-c\C-x<" 'pelm/set-agenda-restriction-lock))
          'append)

(defun pelm/set-agenda-restriction-lock (arg)
  "Set restriction lock to current task subtree or file if prefix is specified"
  (interactive "p")
  (let* ((pom (or (org-get-at-bol 'org-hd-marker)
                  org-agenda-restrict-begin))
         (tags (org-with-point-at pom (org-get-tags-at))))
    (let ((restriction-type (if (equal arg 4) 'file 'subtree)))
      (save-restriction
        (cond
         ((equal major-mode 'org-agenda-mode)
          (org-with-point-at pom
            (org-agenda-set-restriction-lock restriction-type)))
         ((and (equal major-mode 'org-mode) (org-before-first-heading-p))
          (org-agenda-set-restriction-lock 'file))
         (t
          (org-with-point-at pom
            (org-agenda-set-restriction-lock restriction-type))))))))


(add-hook 'org-agenda-mode-hook 
          '(lambda () (hl-line-mode t))
          'append)

(defun pelm/show-org-agenda ()
  (interactive)
  (switch-to-buffer "*Org Agenda*")
  (delete-other-windows)
  (org-agenda-redo))


(custom-set-faces
 '(highlight ((t (:background "cyan"))))
 '(hl-line ((t (:inherit highlight :background "darkseagreen2"))))
 '(org-mode-line-clock ((t (:background "DarkGreen"
                                       ; :foreground "moccasin"
                                        :box (:line-width -1 :style released-button)))) t)
)



;; auto save org files
(run-at-time "00:55" 3600 'org-save-all-org-buffers)


;; crypt setup 
(org-crypt-use-before-save-magic)

;; GPG key to use for encryption
;; Either the Key ID or set to nil to use symmetric encryption.
(setq org-crypt-key "84D33E67")


(defun pelm/mark-next-parent-tasks-todo ()
  "Visit each parent task and change STARTED states to TODO"
  (let ((mystate (or (and (fboundp 'state)
                          org-state)
                     (nth 2 (org-heading-components)))))
    (when (equal mystate "STARTED")
      (save-excursion
        (while (org-up-heading-safe)
          (when (member (nth 2 (org-heading-components)) (list "STARTED"))
            (org-todo "TODO")))))))

(add-hook 'org-after-todo-state-change-hook 'pelm/mark-next-parent-tasks-todo 'append)
(add-hook 'org-clock-in-hook 'pelm/mark-next-parent-tasks-todo 'append)



;; html export
(setq org-html-coding-system 'utf-8)
(setq org-html-head-include-default-style nil)
(setq org-html-head-include-scripts nil)

(provide 'pelm-org)
;;; pelm-org.el ends here

