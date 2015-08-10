;;; kp-dev-python --- python configuation

;;; Code:

(elpy-enable)

(require 'py-autopep8)
(setq py-autopep8-options '("--ignore=E501,W690,W391,W293"))
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;; enable rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook `go-mode-hook `rainbow-delimiters-mode)

;; use flycheck not flymake
(when (require 'flycheck nil t)
  (setq elpy-modules
        (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; indent on RET
(add-hook 'python-mode-hook
          '(lambda ()
             (define-key global-map (kbd "RET")
               'newline-and-indent)))

(provide 'kp-dev-python)

;;; kp-dev-python.el ends here
