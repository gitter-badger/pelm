;;; blog engine for Emacs
(require 'jekyll)
(setq jekyll-directory "~/src/looking4/")
(global-set-key (kbd "C-c b n") 'jekyll-draft-post)
(global-set-key (kbd "C-c b P") 'jekyll-publish-post)
(global-set-key (kbd "C-c b p") (lambda () 
				  (interactive)
                                   (find-file "~/src/looking4/_posts/")))
 (global-set-key (kbd "C-c b d") (lambda () 
                                   (interactive)
                                   (find-file "~/src/looking4/_drafts/")))



;;hyde templates functions
(defun hyde-new-draft()
  "Init a new blog post for hyde engine"
  (interactive)
  (insert "{% extends \"_post.html\" %}\n{%hyde\n   title:\n   categories:\n   created: ")
  (insert (format-time-string "%Y-%m-%d"))
  (insert "\n%}\n{% block article %}\n{% article %}\n\n{% endarticle %}\n{% endblock %}")
  (goto-line 9)
)