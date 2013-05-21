;;; pelm-org.el --- PELM configuration for linux
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

(defun pelm-linux-toggle-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

(when (string-match "linux" system-configuration)
  (define-key pelm-keymap "uf" 'pelm-linux-toggle-fullscreen)
  (set-face-font 'default  "Ubuntu Mono-13")
  )

;这里补充几点：
;首先你需要安装文泉驿正黑（也可以配置成你喜欢的其它字体，例如微软雅黑或幼圆）
;我在这里设置环境为 utf8 ，其实是个人的一些小偏执，如果你不设置，默认对中文Windows支持的很好，但是我需要在各种操作系统间切换，保持我所有的文本都是UTF8编码对我非常重要，所以这里就强制了。
(provide 'pelm-linux)
;;; ends pelm-linux.el here
