(setq exec-path (split-string 
                 (concat "/usr/local/bin:~/.oh-my-zsh/bin:" (getenv "PATH"))
                 path-separator))
