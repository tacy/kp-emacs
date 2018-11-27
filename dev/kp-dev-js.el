;;; kp-dev-js --- javascript configuration

;;; Code:
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

;;(add-to-list 'auto-mode-alist '("\\.vue$" . js2-mode))
;; js2-mode

;; Change some defaults: customize them to override
(setq-default js2-basic-offset 2
	      js2-highlight-level 3
              js2-bounce-indent-p nil)

(add-hook 'js2-jsx-hook (lambda ()
			   (setq-default js2-mode-show-parse-errors nil
					 js2-mode-show-strict-warnings nil)
			   (flycheck-mode)
			   (js2-imenu-extras-setup)
			   (prettier-js-mode)
			   (setq prettier-js-command "prettier-eslint")
			   ))

;; js-mode
(setq-default js-indent-level 2)      ;;缩进

(provide 'kp-dev-js)

;;; kp-dev-js.el ends here
