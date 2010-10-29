;; init.el of emacs
;; Author: Caker

(setq ROOT-PATH "/Users/eggcaker/Sites/pelm/")

;; runtime
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/runtime") load-path))
(load-file "/Users/eggcaker/Sites/pelm/runtime/init.el")

;; common
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/common") load-path))
(load-file "/Users/eggcaker/Sites/pelm/common/theme.el")
(load-file "/Users/eggcaker/Sites/pelm/common/shortkeys.el")
(load-file "/Users/eggcaker/Sites/pelm/common/format.el")
(load-file "/Users/eggcaker/Sites/pelm/common/misc.el")

;; modules
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/modules") load-path))
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/modules/php/") load-path))
(load-file "/Users/eggcaker/Sites/pelm/modules/php/init.el")
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/modules/objc/") load-path))
(load-file "/Users/eggcaker/Sites/pelm/modules/objc/init.el")
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/modules/org/") load-path))
(load-file "/Users/eggcaker/Sites/pelm/modules/org/init.el")
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/modules/ac/") load-path))
(load-file "/Users/eggcaker/Sites/pelm/modules/ac/init.el")
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/modules/yasnippet/") load-path))
(load-file "/Users/eggcaker/Sites/pelm/modules/yasnippet/init.el")
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/modules/blog/") load-path))
(load-file "/Users/eggcaker/Sites/pelm/modules/blog/init.el")
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/modules/markups/") load-path))
(load-file "/Users/eggcaker/Sites/pelm/modules/markups/init.el")
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/modules/yaml/") load-path))
(load-file "/Users/eggcaker/Sites/pelm/modules/yaml/init.el")
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/modules/geben/") load-path))
(load-file "/Users/eggcaker/Sites/pelm/modules/geben/init.el")
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/modules/cedet/") load-path))
(load-file "/Users/eggcaker/Sites/pelm/modules/cedet/common/cedet.el")
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/modules/ecb/") load-path))
(load-file "/Users/eggcaker/Sites/pelm/modules/ecb/init.el")
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/modules/mk-project/") load-path))
(load-file "/Users/eggcaker/Sites/pelm/modules/mk-project/init.el")
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/modules/git/") load-path))
(load-file "/Users/eggcaker/Sites/pelm/modules/git/init.el")

;; os
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/os") load-path))
(load-file "/Users/eggcaker/Sites/pelm/os/mac.el")

;; private
(setq load-path (append (list "/Users/eggcaker/Sites/pelm/private") load-path))
(load-file "/Users/eggcaker/Sites/pelm/private/caker.el")

(package-manager-show-load-time)
