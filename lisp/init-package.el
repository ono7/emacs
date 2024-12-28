;; lisp/init-package.el
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; when running without deamon
;(when (memq window-system '(mac ns x))
;  (exec-path-from-shell-initialize))

;; when running as daemon
(when (daemonp)
  (exec-path-from-shell-initialize))

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
