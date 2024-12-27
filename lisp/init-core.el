;; lisp/init-core.el
(setq inhibit-startup-message t
      visible-bell nil
      ring-bell-function 'ignore
      make-backup-files nil
      auto-save-default nil
      initial-scratch-message nil)

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; disable message after startup on the command area
(defun display-startup-echo-area-message ()
  (message ""))

(setq auto-save-default nil)  ; disable auto-save files (#foo#)
(setq make-backup-files nil)  ; disable backup files (foo~)

;; Disable all process-related prompts
(setq confirm-kill-processes nil)
(setq kill-buffer-query-functions nil)

;; this is very aggressive, testing kill-buffer-query-functions first
;; (setq confirm-kill-processes nil) ;; Don't prompt for running processes

;; no delay when deleting pairs
(setopt delete-pair-blink-delay 0)


(prefer-coding-system 'utf-8)

(setq-default select-enable-primary t)

;; avoid leaving a gap between the frame and the screen
(setq-default frame-resize-pixelwise t)
