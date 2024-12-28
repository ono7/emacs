;; Set default face for modeline
(set-face-attribute 'mode-line nil
                    :background "#313545"
                    :foreground "#d4d4d4"
                    :box `(:line-width 1 :color "#3d3d3d")
                    :height 0.9)

;; Set face for inactive modeline
(set-face-attribute 'mode-line-inactive nil
                    :background "#1d1d1d"
                    :foreground "#666666"
                    :box `(:line-width 1 :color "#2d2d2d")
                    :height 0.9)

;; Custom mode line format
(setq-default mode-line-format
	      (list
	       ;; Buffer status (read-only, modified)
	       '(:eval (cond (buffer-read-only " ⚯")
			     ((buffer-modified-p) " ●")
			     (t " ")))

	       ;; Buffer name
	       " %b "

	       ;; Major mode
	       '(:eval (propertize " %m " 'face '(:inherit mode-line :foreground "#87afaf")))

	       ;; Line and column numbers
	       " %l:%c "

	       ;; Right-aligned items
	       '(:eval
		 (propertize
		  (format-mode-line
		   (list
		    ;; Git branch (if vc-mode is loaded)
		    '(:eval (when vc-mode
			      (format " %s " (substring vc-mode 5))))
		    ;; Encoding
		    '(:eval (let ((sys (coding-system-plist buffer-file-coding-system)))
			      (if (memq (plist-get sys :category)
					'(coding-category-undecided coding-category-utf-8))
				  " UTF-8 "
				(upcase (symbol-name (plist-get sys :name))))))))))))

;; Optional: Add padding to the mode line
(setq-default mode-line-format
              (cons "" mode-line-format))

;; Hide certain minor modes from modeline
(setq minor-mode-alist
      (delq (assq 'auto-revert-mode minor-mode-alist)
            minor-mode-alist))

;; Refresh mode line
(force-mode-line-update t)
