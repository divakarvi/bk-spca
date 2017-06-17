;;;;;;;;;;;;;;;;; basic customizations ;;;;;;;;;;;;;;;;;;
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
;turn off startup message 
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
;(global-unset-key [down-mouse-1]) ;stop marking during mouse click
;cut-and-paste between emacs and other apps
(setq x-select-enable-clipboard t)
;not sure if stuff below is needed
(require 'dired) 
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)

;;;;;;;;;;;;;;;;; key bindings ;;;;;;;;;;;;;;;;;;;;;;;
;bind M-g to goto-line
(global-set-key "\M-g" 'goto-line)
;bind M-i to imenu
(global-set-key "\M-i" 'imenu)
;bind [home] to file begin
(global-set-key [home] "\M-<") 
;bind [end] to file end
(global-set-key [end] "\M->")
;bind [f3] to begin keyboard macro 
(global-set-key [f3] 'start-kbd-macro)
;bind [f4] to end keyboard macro
(global-set-key [f4] 'end-kbd-macro)
;bind [f5] to exec keyboard macro
(global-set-key [f5] 'call-last-kbd-macro)
;M-/ to comment/uncomment
(global-set-key "\M-/" 'comment-dwim)
;backward kill line
(defun backward-kill-line ()
  (interactive)
  (kill-whole-line)
  (move-end-of-line 1))
(global-set-key "\C-b" 'backward-kill-line)

;;;;;;;;;;;;;;;;;;;;;;;;; no git ;;;;;;;;;;;;;;;;;;;;;;;;;
;-ng switch disables version control, useful over sshfs
;ng = no git
;"emacs -ng" to open emacs git/vc awareness disabled
(defun dvi-argument-fn (switch)
  (message "disabling version control")
  (setq vc-handled-backends ()))
(add-to-list 'command-switch-alist '("-ng" . dvi-argument-fn))
(setq vc-handled-backends ())

;;;;;;;;;;;;;;;;;;;;;;;;;dv-pyi;;;;;;;;;;;;;;;;;;;;;;;;;
;;inserts "from __future__" preamble in python source 
(defun dv-pyi ()
  (interactive)
  (message "make Python 2 compatible with Python 3")
  (insert "from __future__ import absolute_import\n")
  (insert "from __future__ import print_function\n"))


;;;;;;;;;;;;;;;;;;;;;;;;;page-up-down;;;;;;;;;;;;;;;;;;;;;;;;
;;change behavior of page up and page down keys
;;to preserve screen position
(defun dvi-page-next ()
  (interactive)
  (setq scroll-preserve-screen-position t)
  (scroll-up)
  (setq scroll-preserve-screen-position nil))
(defun dvi-page-prior ()
  (interactive)
  (setq scroll-preserve-screen-position t)
  (scroll-down)
  (setq scroll-preserve-screen-position nil))
(global-set-key [next] 'dvi-page-next)
(global-set-key [prior] 'dvi-page-prior)

;;;;;;;;;;;;;;;;;;;;;;;;;dv-toggle-scroll;;;;;;;;;;;;;;;;;;;
;;(setq scroll-preserve-screen-position t)
;;(setq scroll-margin 12);
;;toggle scrolling
;;mode 0: text is fixed, cursor is moved
;;mode 1: text is moved, cursor is fixed
(setq dvi-toggle-var 1)
(defun dvi-scroll-up ()
 (interactive)
 (previous-line)
 (scroll-down 1))
(defun dvi-scroll-down ()
 (interactive)
 (next-line)
 (scroll-up 1))
(defun dv-toggle-scroll ()
  (interactive)
  (message "arrow keys move cursor in win/doc through win")
  (if (equal dvi-toggle-var 0)
      (progn
	(global-set-key [up] 'previous-line)
	(global-set-key [down] 'next-line)
	(setq dvi-toggle-var 1))
    (progn
      (global-set-key [up] 'dvi-scroll-up)
      (global-set-key [down] 'dvi-scroll-down)
      (setq dvi-toggle-var 0))))


;;;;;;;;;;;;;;;;;;;;;;;;;dv-point-reg;;;;;;;;;;;;;;;;;;;;;;;
;;saving point to reg a and jumping backback from anywhere
(defun dv-ma ()
  (interactive)
  (message "saving point in reg a")
  (point-to-register ?a))
(defun dv-mb ()
  (interactive)
  (message "saving point in reg b")
  (point-to-register ?b))
(defun dv-mc ()
  (interactive)
  (message "saving point in reg c")
  (point-to-register ?c))
(defun dv-md ()
  (interactive)
  (message "saving point in reg d")
  (point-to-register ?d))
(defun dv-me ()
  (interactive)
  (message "saving point in reg e")
  (point-to-register ?e))
(defun dv-mf ()
  (interactive)
  (message "saving point in reg f")
  (point-to-register ?f))
(defun dv-mg ()
  (interactive)
  (message "saving point in reg g")
  (point-to-register ?g))
(defun dv-mh ()
  (interactive)
  (message "saving point in reg h")
  (point-to-register ?h))
(defun dv-mi ()
  (interactive)
  (message "saving point in reg i")
  (point-to-register ?i))

(defun dv-ja ()
  (interactive)
  (message "jumping to reg a")
  (jump-to-register ?a))
(defun dv-jb ()
  (interactive)
  (message "jumping to reg b")
  (jump-to-register ?b))
(defun dv-jc ()
  (interactive)
  (message "jumping to reg c")
  (jump-to-register ?c))
(defun dv-jd ()
  (interactive)
  (message "jumping to reg d")
  (jump-to-register ?d))
(defun dv-je ()
  (interactive)
  (message "jumping to reg e")
  (jump-to-register ?e))
(defun dv-jf ()
  (interactive)
  (message "jumping to reg f")
  (jump-to-register ?f))
(defun dv-jg ()
  (interactive)
  (message "jumping to reg g")
  (jump-to-register ?g))
(defun dv-jh ()
  (interactive)
  (message "jumping to reg h")
  (jump-to-register ?h))
(defun dv-ji ()
  (interactive)
  (message "jumping to reg i")
  (jump-to-register ?i))

(global-set-key (kbd "C-M-1") 'dv-ma)
(global-set-key (kbd "C-M-2") 'dv-mb)
(global-set-key (kbd "C-M-3") 'dv-mc)
(global-set-key (kbd "C-M-4") 'dv-md)
(global-set-key (kbd "C-M-5") 'dv-me)
(global-set-key (kbd "C-M-6") 'dv-mf)
(global-set-key (kbd "C-M-7") 'dv-mg)
(global-set-key (kbd "C-M-8") 'dv-mh)
(global-set-key (kbd "C-M-9") 'dv-mi)

(global-set-key (kbd "C-1") 'dv-ja)
(global-set-key (kbd "C-2") 'dv-jb)
(global-set-key (kbd "C-3") 'dv-jc)
(global-set-key (kbd "C-4") 'dv-jd)
(global-set-key (kbd "C-5") 'dv-je)
(global-set-key (kbd "C-6") 'dv-jf)
(global-set-key (kbd "C-7") 'dv-jg)
(global-set-key (kbd "C-8") 'dv-jh)
(global-set-key (kbd "C-9") 'dv-ji)


;;;;;;;;;;;;;;;;;;;;;;;;;dv-c-offset;;;;;;;;;;;;;;;;;;;;;;;;;
;;toggles c-offset between 8 space and 2 space
(defun dv-c-offset-828 ()
  (interactive)
  (if (equal c-basic-offset 8) 
      (setq c-basic-offset 2)
    (setq c-basic-offset 8)))


;;;;;;;;;;;;;;;;;;;;;;;;;dv-remove-dos-eol;;;;;;;;;;;;;;;;;;;
;;Johan BockgÃrd as presented by binOr on stackoverflow.com
;;added dv for easier line completion
(defun dv-hide-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;;;;;;;;;;;;;;;;;;;;;;;;;dv-dos2unix;;;;;;;;;;;;;;;;;;;;
;;from sudeepdino008 on stackoverflow.com
(defun dv-dos2unix ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\r" nil t) (replace-match "")))

;;;;;;;;;;;;;;;;;;;;;;;;;dv-mode-line-header-swap;;;;;;;;;;;;
;;exchange mode-line and header-line at start-up on screms
(defun dv-swap-mode-line-header ()
  (interactive)
  (when (not (boundp 'dv-temp))
    (setq-default dv-temp mode-line-format)
    (setq-default mode-line-format header-line-format)
    (setq-default header-line-format dv-temp)
    (setq dv-temp nil))
)



;;;;;;;;;;;;;;;;;;;; c-mode gnu indentation with 8 space indentation ;;;;;;;
(setq c-default-style "gnu")
(setq-default c-basic-offset 8)

;;;;;;;;;;;;;;;;;;;; auto-mode-alist ;;;;;;;;;;;;;;;;;;;;
;make files
(add-to-list 'auto-mode-alist '("\\.mak" . makefile-mode))
;matlab 
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
;git commit
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . shell-script-mode))

;;;;;;;;;;;;;;;;;;;; markdown mode ;;;;;;;;;;;;;;;;;;;;
(autoload 'markdown-mode "~/local/emacs-modes/markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;;;;;;;;;;;;;;;;;;; maple mode ;;;;;;;;;;;;;;;;;;;;
(load-file "~/local/emacs-modes/maplev.el")
(setq auto-mode-alist (cons `("\\.mpl\\'" . maplev-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;; CUDA mode ;;;;;;;;;;;;;;;;;;;;
(load-file "~/local/emacs-modes/cuda-mode.el")
(setq auto-mode-alist (cons `("\\.cu\\'" . cuda-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;imenu
(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-to-menubar "iMenu") (error nil)))
(add-hook 'font-lock-mode-hook 'try-to-add-imenu)

;;;;;;;;;;;;;;;;;;;; tabbar ;;;;;;;;;;;;;;;;;;;;
(load-file "~/local/emacs-modes/tabbar.el")
(require 'tabbar)
(tabbar-mode)

;customization of tabbar, 
;copied from 
;http://zhangda.wordpress.com/2012/09/21/tabbar-mode-rocks-with-customization/
;with minor changes
(custom-set-faces
 '(tabbar-default ((t (:inherit variable-pitch :foreground "black" :height 150 :weight normal))))
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


;;;;;;;;;;;;;;;;;;;; cscope within  emacs ;;;;;;;;;;;;;;;;;;;;
; (require 'xcscope)


