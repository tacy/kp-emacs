;;; init --- configuration initialization
;;; Commentary:

;; Thanks to Kevin Beam and Matt Savoie for starting me
;; on my emacs journey. Without there encouragment,
;; hand-me-down configurations and help along the way
;; I would not be a part of the wonderful emacs community!
;;
;; Kevin Beam:  https://github.com/kwbeam/kwb-emacs
;; Matt Savoie: https://github.com/flamingbear/emacs-config
;;
;; This configuration has grown from the two above.

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; (setq default-directory "~/workspace/" )

(require 'kp-packages)
(require 'kp-ui)
(require 'kp-dev)

(require 'helm-config)
(helm-mode 1)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq magit-last-seen-setup-instructions "1.4.0")

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(set-clipboard-coding-system 'utf-8)
(simpleclip-mode 1)

;; (add-hook 'after-init-hook 'global-company-mode)
;; (add-to-list 'company-backends 'company-yasnippet)

(turn-on-pbcopy)

(setq elpy-rpc-backend "jedi")  ;; set elpy rpc backend to jedi
(setq flycheck-highlighting-mode 'lines)  ;; flycheck very slow set to symbols

;; ToggleWindows C-x |
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

;; fix emacs shell cursor jump to middle of screen, refer:
;; http://askubuntu.com/questions/204392/emacs-shell-mode-pointer-always-goes-to-middle
(remove-hook 'comint-output-filter-functions
             'comint-postoutput-scroll-to-bottom)

(require 'kp-kbd)

(setq confirm-kill-emacs 'y-or-n-p) ;exit emacs confirm

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company jedi-core web-mode swiper sql-indent simpleclip pbcopy magit jekyll-modes go-guru go-dlv flycheck-color-mode-line exec-path-from-shell elpy ein dockerfile-mode company-jedi company-go better-defaults ac-js2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
