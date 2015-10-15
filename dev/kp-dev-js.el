;;; kp-dev-js --- javascript configuration

;;; Code:

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq js2-highlight-level 3)
(setq-default js2-basic-offset 4)

;; (require 'flycheck)
;; (add-hook 'js-mode-hook
;;           (lambda () (flycheck-mode t)))

(provide 'kp-dev-js)

;;; kp-dev-js.el ends here
