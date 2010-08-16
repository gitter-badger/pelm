;;; blog engine for Emacs
(require 'jekyll)
(setq jekyll-directory "~/Sites/looking4")
(global-set-key (kbd "C-c b n") 'jekyll-draft-post)
(global-set-key (kbd "C-c b P") 'jekyll-publish-post)
(global-set-key (kbd "C-c b p") (lambda () 
                (interactive)
                                   (find-file "~/Sites/looking4/_posts/")))
 (global-set-key (kbd "C-c b d") (lambda () 
                                   (interactive)
                                   (find-file "~/Sites/looking4/_drafts/")))



