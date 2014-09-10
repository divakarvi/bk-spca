;; basic customization
(add-to-list 'default-frame-alist '(height . 21))
(add-to-list 'default-frame-alist '(width . 70))
(set-face-attribute 'default nil :font "DejaVu Sans Mono-15")
(global-set-key [f1] "\M-<");
(global-set-key [f2] "\M->");
(global-set-key [f3] 'start-kbd-macro)
(global-set-key [f4] 'end-kbd-macro)
(global-set-key [f5] 'call-last-kbd-macro)
(define-key global-map "\M-g" 'goto-line)
(setq make-backup-files nil)       
;(setq auto-save-default nil)
(require 'dired)

;; auto-mode-alist
(setq auto-mode-alist
     (append '(("\\.mak" . makefile-mode)("\\.m$" . octave-mode))
	      auto-mode-alist))
;; maple mode
(load-file "~/emacs-modes/maplev.el")
(setq auto-mode-alist (cons `("\\.mpl\\'" . maplev-mode) auto-mode-alist))
;; CUDA mode
(load-file "~/emacs-modes/cuda-mode.el")
(setq auto-mode-alist (cons `("\\.cu\\'" . cuda-mode) auto-mode-alist))
;; c-mode for gnu indentation
(setq c-default-style "gnu")

;; imenu
(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-to-menubar "iMenu") (error nil)))
(add-hook 'font-lock-mode-hook 'try-to-add-imenu)

;; tabbar
(load-file "~/emacs-modes/tabbar.el")
(require 'tabbar)
(tabbar-mode)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
