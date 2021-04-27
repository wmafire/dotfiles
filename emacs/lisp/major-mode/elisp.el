;;; package -- elisp-config
;;; Commentary:
;;; Code:
(use-package
  elisp-format
  :ensure t
  :defer t
  :init                                 ;
  (w/create-leader-key-for-mode 'emacs-lisp-mode "f" 'elisp-format-buffer "format" content-map-prefix))
(provide 'major-mode/elisp)
;;; java-config.el ends here
