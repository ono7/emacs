(use-package format-all
  :preface
  (defun ian/format-code ()
    "Auto-format whole buffer."
    (interactive)
    (if (derived-mode-p 'prolog-mode)
        (prolog-indent-buffer)
      (format-all-buffer)))
  :config
  ;; this is a capital F...
  (global-set-key (kbd "M-F") #'ian/format-code)
  (add-hook 'prog-mode-hook #'format-all-ensure-formatter))
