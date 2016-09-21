;;; kp-dev-markdown --- markdown configuration

;;; Code:

(add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . gfm-mode))
(setq markdown-command "marked")

(provide 'kp-dev-markdown)

;;; kp-dev-markdown.el ends here
