;;; package -- eshell
;;; Commentary:
;;; Code:

(setq eshell-history-size 1024)
(setq eshell-hist-ignoredups t)
(setq eshell-cmpl-ignore-case t)
(setq eshell-cp-interactive-query t)
(setq eshell-ln-interactive-query t)
(setq eshell-mv-interactive-query t)
(setq eshell-rm-interactive-query t)
(setq eshell-mv-overwrite-files nil)

(use-package
  eshell-toggle
  :ensure t
  :defer t
  :init (w/create-leader-key "t" 'eshell-toggle "toggle-terminal" view-map-prefix)
  :bind ("C-`" . eshell-toggle))
(use-package
  esh-autosuggest
  :ensure t
  :defer t
  :hook (eshell-mode . esh-autosuggest-mode))
(use-package
  eshell-syntax-highlighting
  :ensure t
  :defer t
  :hook (eshell-mode . eshell-syntax-highlighting-mode))

(provide 'major-mode/eshell)
;;; eshell.el ends here
