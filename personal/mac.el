;;; mac.el setups for mac osx
;; 

(if (eq system-type 'darwin)

  ;; font set only for mac OSx
  ;;(set-frame-font "Menlo-15")
  (set-frame-font "DejaVu Sans Mono-15"))


;; Almost maximum size oln a iMac 27"
(setq default-frame-alist
      '((top . 20)
        (left . 5)
        (width . 250)
        (height . 70)))
