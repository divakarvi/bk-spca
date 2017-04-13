;basic customizations
;window height
(add-to-list 'default-frame-alist '(height . 26))
;window width 
(add-to-list 'default-frame-alist '(width . 80)) 
;font
(set-face-attribute 'default nil :font "DejaVu Sans Mono-15") 
;turn-off irritating backups      
(setq make-backup-files nil) 
;turn off tool-bar
(tool-bar-mode -1) 
;the mark-ring is perfectly useless
(setq mark-ring-max 0) 
;(global-unset-key [down-mouse-1]) ;stop marking during mouse click

;-ng switch disables version control, useful over sshfs
;ng = no git
;"emacs -ng" to open emacs git/vc awareness disabled
(defun my-argument-fn (switch)
  (message "disabling version control")
  (setq vc-handled-backends ()))
(add-to-list 'command-switch-alist '("-ng" . my-argument-fn))


;not sure if stuff below is needed
(require 'dired) 
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;bind M-g to goto-line
(define-key global-map "\M-g" 'goto-line)
;bind [f1] to file begin
(global-set-key [f1] "\M-<") 
;bind [f2] to file end
(global-set-key [f2] "\M->")
;bind [f3] to begin keyboard macro 
(global-set-key [f3] 'start-kbd-macro)
;bind [f4] to end keyboard macro
(global-set-key [f4] 'end-kbd-macro)
;bind [f5] to exec keyboard macro
(global-set-key [f5] 'call-last-kbd-macro)
;f8 toggles c-offset between 8 space and 5 space
(defun dv-c-offset ()
  (interactive)
  (if (equal c-basic-offset 8) 
      (setq c-basic-offset 5)
    (setq c-basic-offset 8)))
(global-set-key [f8] 'dv-c-offset)




;(setq scroll-preserve-screen-position t)
;(setq scroll-margin 12);

;;use f10 to toggle scrolling
;;mode 0: text is fixed, cursor is moved
;;mode 1: text is moved, cursor is fixed
(defun dv-scroll-up ()
 (interactive)
 (previous-line)
 (scroll-down 1))
(defun dv-scroll-down ()
 (interactive)
 (next-line)
 (scroll-up 1))
(setq dv-toggle-var 1);
(defun dv-toggle-up-down ()
  (interactive)
  (if (equal dv-toggle-var 0)
      (progn
	(global-set-key [up] 'previous-line)
	(global-set-key [down] 'next-line)
	(setq dv-toggle-var 1))
    (progn
      (global-set-key [up] 'dv-scroll-up)
      (global-set-key [down] 'dv-scroll-down)
      (setq dv-toggle-var 0))))
(global-set-key [f10] 'dv-toggle-up-down)

;change behavior of page up and page down keys
;to preserve screen position
(defun dv-page-next ()
  (interactive)
  (setq scroll-preserve-screen-position t)
  (scroll-up)
  (setq scroll-preserve-screen-position nil))
(defun dv-page-prior ()
  (interactive)
  (setq scroll-preserve-screen-position t)
  (scroll-down)
  (setq scroll-preserve-screen-position nil))
(global-set-key [next] 'dv-page-next)
(global-set-key [prior] 'dv-page-prior)

;c-mode gnu indentation with 8 space indentation
(setq c-default-style "gnu")
(setq-default c-basic-offset 8)

;8 space indentation in python
(add-hook 'python-mode-hook
	  '(lambda ()
	     (setq python-indent 8)))

;auto-mode-alist
(setq auto-mode-alist
     (append '(("\\.mak" . makefile-mode)("\\.m$" . octave-mode))
	      auto-mode-alist))
;maple mode
(load-file "~/local/emacs-modes/maplev.el")
(setq auto-mode-alist (cons `("\\.mpl\\'" . maplev-mode) auto-mode-alist))

;CUDA mode
(load-file "~/local/emacs-modes/cuda-mode.el")
(setq auto-mode-alist (cons `("\\.cu\\'" . cuda-mode) auto-mode-alist))

;imenu
(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-to-menubar "iMenu") (error nil)))
(add-hook 'font-lock-mode-hook 'try-to-add-imenu)

;tabbar
(load-file "~/local/emacs-modes/tabbar.el")
(require 'tabbar)
(tabbar-mode)

;customization of tabbar, 
;copied from 
;http://zhangda.wordpress.com/2012/09/21/tabbar-mode-rocks-with-customization/
;with minor changes
(custom-set-faces
 '(tabbar-default ((t (:inherit variable-pitch :foreground "black" :height 120 :weight normal))))
 '(tabbar-button ((t (:inherit tabbar-default :foreground "dark red"))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-highlight ((t (:underline t))))
 '(tabbar-separator ((t (:inherit tabbar-default :background "#95CA59"))))
 '(tabbar-unselected ((t (:inherit tabbar-default)))))

;key binding to move between tabs
(global-set-key (kbd "C-<") 'tabbar-backward-group)
(global-set-key (kbd "C->") 'tabbar-forward-group)
(global-set-key (kbd "C-,") 'tabbar-backward)
(global-set-key (kbd "C-.") 'tabbar-forward) 

;exchange mode-line and header-line at start-up on screms
;(when (not (boundp 'dv-temp))
;  (setq-default dv-temp mode-line-format)
;  (setq-default mode-line-format header-line-format)
;  (setq-default header-line-format dv-temp)
;  (setq dv-temp nil))

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
(put 'upcase-region 'disabled nil)

