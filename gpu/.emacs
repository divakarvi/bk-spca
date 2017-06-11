;c++-mode for .cu files
(setq auto-mode-alist
     (append '(("\\.mak" . makefile-mode) ("\\.cu" . c++-mode))
	      auto-mode-alist))	
