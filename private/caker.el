;; set project main directory
(setq default-directory "~/src/Android/BuzzLists/")

;; ecb defined 
(custom-set-variables
 '(ecb-layout-name "left1")
 '(ecb-layout-window-sizes (quote (("left1" (0.30 . 0.30) (0.15 . 0.35) (0.15 . 0.35) (0.30 . 0.35)))))
 '(jabber-alert-message-hooks (quote (jabber-message-awesome jabber-message-echo jabber-message-scroll)))
 '(jabber-alert-presence-hooks (quote (jabber-presence-awesome jabber-presence-echo)))
 '(jabber-avatar-verbose nil)
 '(jabber-show-offline-contacts nil)
 '(jabber-vcard-avatars-publish nil)
 '(jabber-vcard-avatars-retrieve nil)
 )

;; android configurations
(add-hook 'gud-mode-hook
    (lambda ()
            (add-to-list 'gud-jdb-classpath "~/Library/android-sdk-mac_x86/platforms/android-8/android.jar ")
    )
)

(custom-set-variables
  '(android-mode-avd "version2.2")
  '(android-mode-sdk-dir "~/Library/android-sdk-mac_x86")

)

;; jabber start 
(setq jabber-account-list
      '(("eggcaker@gmail.com" 
    (:network-server . "talk.google.com")
    (:connection-type . ssl))))

;;(jabber-connect-all)

;;emacs  server start
(server-start)
