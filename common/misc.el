;;misc configurations

;yes -> y no -> n
(fset 'yes-or-no-p 'y-or-n-p)

;; no backups
(setq make-backup-files nil)

;;hidden scroll-bar
(when window-system
    (set-scroll-bar-mode nil))

;;hidden menu bar
;(menu-bar-mode -99)

;;transparent window
;(set-frame-parameter (selected-frame) 'alpha '(90 50))
;(add-to-list 'default-frame-alist '(alpha 90 50))


;; switch buffer
;(require 'iswitchb)
(iswitchb-mode 1)
;;============================================================
;; iswitchb ignores
;;============================================================
(add-to-list 'iswitchb-buffer-ignore "^ ")
(add-to-list 'iswitchb-buffer-ignore "*Messages*")
(add-to-list 'iswitchb-buffer-ignore "*ECB")
(add-to-list 'iswitchb-buffer-ignore "*Buffer")
(add-to-list 'iswitchb-buffer-ignore "*Completions")
(add-to-list 'iswitchb-buffer-ignore "*ftp ")
(add-to-list 'iswitchb-buffer-ignore "*bsh")
(add-to-list 'iswitchb-buffer-ignore "^[tT][aA][gG][sS]$")

;; auto rebuffer 
(global-auto-revert-mode t) 

(require 'scratch)


(defun kill-buffer-no-question ()
  (interactive)
  (kill-buffer (buffer-name)))
(global-set-key "\C-xk" 'kill-buffer-no-question)

;;go away stupid mouse !
(mouse-avoidance-mode 'animate)

;; highlight the bracket 
(show-paren-mode t)
;; disable jumping betwen bracket
(setq show-paren-style 'parentheses)