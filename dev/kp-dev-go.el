;;; kp-dev-go --- golang configuration

;; http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/

;;; Code:

(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))

;; enable rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook `go-mode-hook `rainbow-delimiters-mode)

;; Need to set GOPATH by M-x setenv
;;; (setenv "GOPATH" "/home/tacy/workspace/go")

;; (if (eq system-type 'darwin)
;;     (progn
;;        (load-file "/Users/tacy/workspace/go/go-tools/src/golang.org/x/tools/cmd/oracle/oracle.el")
;;        (setq exec-path (cons "/Users/tacy/workspace/go/go-tools/bin" exec-path))
;;        (add-to-list 'exec-path "/Users/tacy/workspace/go/kubernetes/bin")
;;      )
;;      (progn
;;        (load-file "/home/tacy/workspace/go/go-tools/src/golang.org/x/tools/cmd/oracle/oracle.el")
;;        (setq exec-path (cons "/home/tacy/workspace/go/go-tools/bin" exec-path))
;;        (add-to-list 'exec-path "/home/tacy/workspace/go/kubernetes/bin")
;;      )
;; )


;; (if (eq system-type 'darwin)
;;     (progn
;;        (load-file "/Users/tacy/workspace/go/go-tools/src/golang.org/x/tools/cmd/guru/go-guru.el")
;;        (setq exec-path (cons "/Users/tacy/workspace/go/go-tools/bin" exec-path))
;;        ;;(add-to-list 'exec-path "/Users/tacy/workspace/go/kubernetes/bin")
;;      )
;;      (progn
;;        (load-file "/home/tacy/workspace/go/go-tools/src/golang.org/x/tools/cmd/guru/go-guru.el")
;;        (setq exec-path (cons "/home/tacy/workspace/go/go-tools/bin" exec-path))
;;        (setenv "PATH" (concat "/home/tacy/workspace/go/go-tools/bin:" (getenv "PATH")))
;;        ;;(add-to-list 'exec-path "/home/tacy/workspace/go/kubernetes/bin")
;;      )
;; )

(if (eq system-type 'darwin)
    (progn
       (setq exec-path (cons "/Users/tacy/workspace/go/go-tools/bin" exec-path))
       ;;(add-to-list 'exec-path "/Users/tacy/workspace/go/kubernetes/bin")
     )
     (progn
       (setq exec-path (cons "/home/tacy/workspace/go/go-tools/bin" exec-path))
       (setenv "PATH" (concat "/home/tacy/workspace/go/go-tools/bin:" (getenv "PATH")))
       ;;(add-to-list 'exec-path "/home/tacy/workspace/go/kubernetes/bin")
     )
)


;; run gofmt on save
(add-hook 'before-save-hook 'gofmt-before-save)

;; autocompletion with company-mode
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends)
                               '(company-go))
                          (company-mode)))


(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") 'godef-jump)))
(setq compile-command "go generate && go build -v && go test -v && go vet")

;; (add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook (lambda ()
                          (setq flycheck-disabled-checkers
                               '(go-build go-test go-errcheck))
                          (flycheck-mode)
                          )
          )

(go-guru-hl-identifier-mode)
(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)

;; folding text
(add-hook 'go-mode-hook 'origami-mode)

(defun origami-mode-config ()
  "For use in `origami-mode-hook'."
  ;;(local-set-key (kbd "<C-right>") 'sgml-skip-tag-forward) ; add a key
  ;;(local-set-key (kbd "C-c C-p") nil) ; example of remove a key
  ;; (local-set-key (kbd "TAB") 'origami-recursively-toggle-node)
  ;; (local-set-key (kbd "M-TAB") 'origami-toggle-all-nodes)
  ;; more here
  )

;; add to hook
(add-hook 'origami-mode-hook 'origami-mode-config)

(provide 'kp-dev-go)

;;; kp-dev-go.el ends here
