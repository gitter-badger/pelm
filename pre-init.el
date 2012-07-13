(setq exec-path (split-string 
                 (concat "~/.rvm/rubies/ruby-1.9.3-head/bin:/usr/local/bin:~/.oh-my-zsh/bin:" (getenv "PATH"))
                 path-separator))
