;; lisp/init-core.el
(setq inhibit-startup-message t
      visible-bell nil
      ring-bell-function 'ignore
      make-backup-files nil
      auto-save-default nil
      initial-scratch-message nil)

(when (string= system-type "darwin")       
  (setq dired-use-ls-dired nil))
