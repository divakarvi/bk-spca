;; basic customization
(add-to-list 'default-frame-alist '(height . 26))
(add-to-list 'default-frame-alist '(width . 80))
(set-face-attribute 'default nil :font "DejaVu Sans Mono-15")
(setq make-backup-files nil)       
;(setq auto-save-default nil)
(require 'dired)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(define-key global-map "\M-g" 'goto-line)
(global-set-key [f1] "\M-<");
(global-set-key [f2] "\M->");
(global-set-key [f3] 'start-kbd-macro)
(global-set-key [f4] 'end-kbd-macro)
(global-set-key [f5] 'call-last-kbd-macro)
(defun dv-c-offset ()
  (interactive)
  (if (equal c-basic-offset 8) 
      (setq c-basic-offset 2)
    (setq c-basic-offset 8)))
(global-set-key [f8] 'dv-c-offset)
;(setq scroll-preserve-screen-position t)
;(setq scroll-margin 12);
(defun dv-scroll-up ()
  (interactive)
  (scroll-up 1))
(defun dv-scroll-down ()
  (interactive)
  (scroll-down 1))
(setq dv-toggle-var 1);
(defun dv-toggle-up-down ()
  (interactive)
  (if (equal dv-toggle-var 0)
      (progn
	(global-set-key [up] 'previous-line)
	(global-set-key [down] 'next-line)
	(setq dv-toggle-var 1))
    (progn
      (global-set-key [up] 'dv-scroll-down)
      (global-set-key [down] 'dv-scroll-up)
      (setq dv-toggle-var 0))))
(global-set-key [f10] 'dv-toggle-up-down)

;; c-mode for gnu indentation
(setq c-default-style "gnu")
(setq-default c-basic-offset 8)

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
