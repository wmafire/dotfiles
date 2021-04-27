;;; package -- python-config
;;; Commentary:
;;; Code:

(w/bind-lsp-map-for-mode 'python-mode)
(w/bind-dap-map-for-mode 'python-mode)
(add-hook 'python-mode-hook (lambda ()
                              (require 'dap-python)
                              (lsp-deferred)
                              (dap-mode 1)
                              ;; The modes above are optional
                              (dap-ui-mode 1)
                              ;; enables mouse hover support
                              ;; (dap-tooltip-mode 1)
                              ;; use tooltips for mouse hover
                              ;; if it is not enabled `dap-mode' will use the minibuffer.
                              ;; (tooltip-mode 1)
                              ;; displays floating panel with debug buttons
                              ;; requies emacs 26+
                              ;; (dap-ui-controls-mode 1)
                              ))

(use-package
  lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-python-ms)
                         (lsp-deferred)))
  :init (setq lsp-python-ms-executable (executable-find "python-language-server")))
(provide 'major-mode/python)
;;; python-config.el ends here
