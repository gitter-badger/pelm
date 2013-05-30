;;; pelm-mail.el --- PELM mail setup for gnus
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://iemacs.com/pelm


;; This file is not part of GNU Emacs

;;; Code:

;; packages
; apt-get install libtalloc-dev 
(el-get 'sync '(notmuch))
(require 'notmuch)
;; something about me 
(setq
 user-mail-address "eggcaker@gmail.com"
 user-full-name  "Tongzhu Zhang"
 message-signature
 (concat
  "Tongzhu Zhang\n"
  "http://iemacs.com\n"))

(setq message-kill-buffer-on-exit t)
(setq starttls-use-gnutls t)

(load-library "smtpmail")
(load-library "nnimap")
(load-library "starttls")
(gnus-agentize)

;; 常规设置
(gnus-agentize)                                     ;开启代理功能, 以支持离线浏览
(setq gnus-inhibit-startup-message t)               ;关闭启动时的画面
(setq gnus-novice-user nil)                         ;关闭新手设置, 不进行确认
(setq gnus-expert-user t)                           ;不询问用户
(setq gnus-show-threads t)                          ;显示邮件线索
(setq gnus-interactive-exit nil)                    ;退出时不进行交互式询问
(setq gnus-use-dribble-file nil)                    ;不创建恢复文件
(setq gnus-always-read-dribble-file nil)            ;不读取恢复文件
(setq gnus-asynchronous t)                          ;异步操作
(setq gnus-large-newsgroup 500)                     ;设置大容量的新闻组默认显示的大小

;; customize how to splite the windows
(gnus-add-configuration
 '(article
   (vertical 1.0
             (summary .35 point)
             (article 1.0))))

;; System encoding
;; Anyway, try utf-8
(set-language-environment 'UTF-8)
(setq default-buffer-file-coding-system 'utf-8-unix)
(setq default-keyboard-coding-system 'utf-8-unix)
(setq default-sendmail-coding-system 'utf-8-unix)
(setq default-file-name-coding-system 'utf-8-unix)
(setq default-terminal-coding-system 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(define-key pelm-keymap "m" 'gnus)

(add-to-list 'gnus-secondary-select-methods 
             '(nnimap "gmail"
                      (nnimap-stream shell)
                      (nnimap-shell-programm "/usr/lib/dovecot/imap -o mail_location=maildir:$HOME/mail")
                      )
;             '(nntp "localhost")
             ) 

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

; send mail 
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "eggcaker@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "iemacs.com"
)


;; look and feel
(auto-image-file-mode 1)
(setq w3m-toggle-inline-images t)
(setq mm-inline-large-images t)  
(add-to-list 'mm-attachment-override-types "image/.*")  

(setq gnus-mime-display-multipart-related-as-mixed nil)
(setq mm-text-html-renderer 'w3m)
(eval-after-load "mm-decode"
	'(progn 
		(add-to-list 'mm-discouraged-alternatives "text/html")
	        (add-to-list 'mm-discouraged-alternatives "text/richtext")))
(setq mm-inline-text-html-with-images t)
(setq mm-inline-text-html-with-w3m-keymap nil)

;; Display formate
;; Thread summary
(setq gnus-summary-same-subject "")
(setq gnus-sum-thread-tree-indent "")
(setq gnus-sum-thread-tree-single-indent "")
(setq gnus-sum-thread-tree-root "●")
(setq gnus-sum-thread-tree-false-root "☆")
(setq gnus-sum-thread-tree-vertical "│")
(setq gnus-sum-thread-tree-leaf-with-other "├─►")
(setq gnus-sum-thread-tree-single-leaf "╰─►")

;; 概要显示设置
(setq gnus-summary-gather-subject-limit 'fuzzy) ;聚集题目用模糊算法
(setq gnus-summary-line-format "%4P %U%R%z%O %{%14&user-date;%} %{%-20,20n%} %{%ua%} %B %(%I%-60,60s%)\n")
(defun gnus-user-format-function-a (header) ;用户的格式函数 `%ua'
  (let ((myself (concat "< eggcaker@gmail.com >"))
        (references (mail-header-references header))
        (message-id (mail-header-id header)))
    (if (or (and (stringp references)
                 (string-match myself references))
            (and (stringp message-id)
                 (string-match myself message-id)))
        "X" "│")))
(setq gnus-user-date-format-alist             ;用户的格式列表 `user-date'
      '(((gnus-seconds-today) . "TD %H:%M")   ;当天
        (604800 . "W%w %H:%M")                ;七天之内
        ((gnus-seconds-month) . "%d %H:%M")   ;当月
        ((gnus-seconds-year) . "%m-%d %H:%M") ;今年
        (t . "%y-%m-%d %H:%M")))              ;其他

;; 时间显示
(add-hook 'gnus-article-prepare-hook 'gnus-article-date-local) ;将邮件的发出时间转换为本地时间
(add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp)   ;跟踪组的时间轴
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)              ;新闻组分组

;; 线程设置
(setq
 gnus-use-trees t                                                       ;联系老的标题
 gnus-tree-minimize-window nil                                          ;用最小窗口显示
 gnus-fetch-old-headers 'some                                           ;抓取老的标题以联系线程
 gnus-generate-tree-function 'gnus-generate-horizontal-tree             ;生成水平树
 gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject ;聚集函数根据标题聚集
 )
;; 排序
(setq gnus-thread-sort-functions
      '(
        (not gnus-thread-sort-by-date)                               ;时间的逆序
        (not gnus-thread-sort-by-number)))                           ;跟踪的数量的逆序
;; 自动跳到第一个没有阅读的组
(add-hook 'gnus-switch-on-after-hook 'gnus-group-first-unread-group) ;gnus切换时
(add-hook 'gnus-summary-exit-hook 'gnus-group-first-unread-group)    ;退出Summary时
;; 自动更新新消息
;; 斑纹化
(setq gnus-summary-stripe-regexp        ;设置斑纹化匹配的正则表达式
      (concat "^[^"
              gnus-sum-thread-tree-vertical
              "]*"))


(setq w3m-command "w3m")

(provide 'pelm-mail)
;;; pelm-mail.el ends here
