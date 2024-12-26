;; init.el
(defun load-directory (dir)
  "Load all Emacs Lisp files in DIR."
  (let ((load-it (lambda (f)
                   (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.el$"))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(load "init-core")
(load "init-package")
(load "init-ui")
(load "init-evil")
(load "init-completion")
(load "init-keybinds")
(load "init-dev")
(load "init-utils")
