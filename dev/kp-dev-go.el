;;; kp-dev-go --- golang configuration

;; http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/

;;; Code:

(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))

;; enable rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook `go-mode-hook `rainbow-delimiters-mode)

(setenv "GOPATH" "/Users/kpurdon/projects/gocode")

;; run gofmt on save
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "/Users/kpurdon/projects/gocode/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

;; autocompletion with company-mode
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(setq compile-command "go generate && go build -v && go test -v && go vet")

(require 'go-mode)

(provide 'kp-dev-go)

;;; kp-dev-go.el ends here
