;; keyboard remark
(global-set-key "\M-h" 'delete-backward-char)
(global-set-key "\C-cG" 'end-of-buffer)
(global-set-key "\C-cg" 'beginning-of-buffer)
(global-set-key "\C-c{" 'beginning-of-defun)
(global-set-key "\C-c}" 'end-of-defun)


;;(windmove-default-keybindings)
(global-set-key (kbd "\e <left>") 'windmove-left)
(global-set-key (kbd "\e <down>") 'windmove-down)
(global-set-key (kbd "\e <up>") 'windmove-up)
(global-set-key (kbd "\e <right>") 'windmove-right)
