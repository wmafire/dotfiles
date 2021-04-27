;;; package -- plantuml-config
;;; Commentary:
;;; Code:
(use-package
  plantuml-mode
  :ensure t
  :defer t
  :config (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
  ;; (setq-default plantuml-default-exec-mode 'jar)
  ;; (setq plantuml-jar-path "/Users/baiyan/.emacs.d/plantuml.jar")
  ;; (add-hook 'org-mode-hook (lambda ()
  ;;                            (plantuml-set-exec-mode "jar")))
  :custom                               ;
  (plantuml-default-exec-mode 'executable)
  (plantuml-jar-path ""))
(provide 'major-mode/plantuml)
;;; plantuml-config.el ends here
