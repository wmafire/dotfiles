;;; package -- java-config
;;; Commentary:
;;; Code:
;; (use-package
;;   lsp-java
;;   :ensure t
;;   :after (lsp))

(use-package
  lsp-java
  :ensure t
  :defer t
  :hook (java-mode .
                   (lambda ()
                     (lsp)
                     (dap-mode 1)
                     (dap-ui-mode 1)))
  :config )
;; (use-package
;;   dap-java
;;   :after (lsp-java dap-mode))
;; (use-package
;;   lsp-java-treemacs
;;   :after (treemacs))
(provide 'major-mode/java)
;;; java-config.el ends here
