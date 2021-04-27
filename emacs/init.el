;;; package -- core
;;; Commentary:
;;; Code:
(message "load init")
(when (version< emacs-version "27")
  ;; Emacs版本低于27时，手动加载‘early-init.el’
  (load-file (expand-file-name "early-init.el" user-emacs-directory)))

;;;; Package初始化
(require 'package)
(setq package-user-dir (expand-file-name "packages" user-emacs-directory))
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")
                         ("org" . "http://elpa.emacs-china.org/org/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; 启用use-package统计
(setq use-package-compute-statistics t)
(require 'use-package)

;; 性能统计
(use-package
  benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

;; 安装系统包
(use-package
  use-package-ensure-system-package
  :ensure t
  :defer t)

;;;; Custom文件配置
;; Use `user.el` to save custom config
(setq custom-file (expand-file-name "custom.el" m/misc-file-directory))
;; Load custom config
;; (when (file-exists-p custom-file)
;;   (load-file custom-file))


;;;; 加载配置
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'core)
(require 'major-mode)

(provide 'init)
;;; init.el ends here
