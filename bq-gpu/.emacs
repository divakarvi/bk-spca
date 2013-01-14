(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock)))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )

(put 'eval-expression 'disabled nil)
(global-set-key [f1] "\M-<");
(global-set-key [f2] "\M->");
(global-set-key [f3] 'start-kbd-macro)
(global-set-key [f4] 'end-kbd-macro)
(global-set-key [f5] 'call-last-kbd-macro)
(define-key global-map "\M-g" 'goto-line) 
(require 'dired)

(setq auto-mode-alist
     (append '(("\\.mak" . makefile-mode) ("\\.cu" . c++-mode))
	      auto-mode-alist))	
(setq c-recognize-knr-p nil)
(add-hook 'c-mode-hook (lambda () (setq c-basic-offset 2)))
(set-default-font "9x15")