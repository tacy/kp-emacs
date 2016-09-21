;;; kp-dev-python --- python configuation

;;; Code:

(elpy-enable)

;; Don't need set, elpy auto config. if elpy release 1.11, replace it usy yapf
;; (require 'py-autopep8)
;; (setq py-autopep8-options '("--pep8-passes 2000 --ignore E501,W690,W391,W293"))
;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;; enable rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook `python-mode-hook `rainbow-delimiters-mode)

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

;; autocompletion with company-mode
(add-hook 'python-mode-hook 'company-mode)
(add-hook 'python-mode-hook (lambda ()
                              (set (make-local-variable 'company-backends)
                                   '(company-jedi company-yasnippet))
                          (company-mode)))

(provide 'kp-dev-python)

;;; kp-dev-python.el ends here
