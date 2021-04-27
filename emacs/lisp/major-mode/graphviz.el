;;; package -- graphivz-config
;;; Commentary:
;;; Code:
(use-package
  graphviz-dot-mode
  :ensure t
  :defer t
  :config (add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode))
  (setq-default graphviz-dot-indent-width 4)
  (add-hook 'org-mode-hook
            (lambda ()
              (if (boundp 'org-src-lang-modes)
                  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml)))))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((dot . t))))

(provide 'major-mode/graphviz)
;;; graphivz-config.el ends here
