;;; kp-dev-web --- web configuration

;;; Code:

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq web-mode-engines-alist '(("django"    . "\\.html\\'")))

;; jsx specific configuration
;;(setq web-mode-content-types-alist '(("jsx" . "\\.js\\'")))
;;(defadvice web-mode-highlight-part (around tweak-jsx activate)
;;  (if (equal web-mode-content-type "jsx")
;;      (let ((web-mode-enable-part-face nil))
;;        ad-do-it)
;;    ad-do-it))


;; use eslint with web-mode for jsx files
;; use flycheck not flymake
(when (require 'flycheck nil t)
  (setq-default flycheck-disabled-checkers
		(append flycheck-disabled-checkers
			'(javascript-jshint)))
  ;; (setq flycheck-checkers '(javascript-eslint))
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (add-hook 'web-mode-hook 'flycheck-mode))

(defun eslint-fix-file ()
  (interactive)
  (message "eslint --fixing the file" (buffer-file-name))
  (shell-command (concat "eslint --fix " (buffer-file-name))))

(defun eslint-fix-file-and-revert ()
  (interactive)
  (eslint-fix-file)
  (revert-buffer t t))

(add-hook 'web-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'eslint-fix-file-and-revert)))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-pairing t)

(provide 'kp-dev-web)

;;; kp-dev-web.el ends here
