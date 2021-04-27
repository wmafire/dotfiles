;;;;==================================================
;;;; 用户变量/常量
;;;;==================================================
(defconst m/misc-file-directory (expand-file-name "misc" user-emacs-directory)
  "Save automatically generated files.")
(defconst m/bin-file-directory (expand-file-name "bin" user-emacs-directory)
  "Binary file.")
(defvar m/fontsize 12
  "Default fontsize")

;;;;==================================================
;;;; 加载机器相关的配置
;;;;==================================================
(setq machine-file (expand-file-name "machine.el" user-emacs-directory))
;; Load machine config
(when (file-exists-p machine-file)
  (load-file machine-file))

;;;;==================================================
;;;; UI 设置
;;;;==================================================
;; 移除不需要的GUI元素
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; 初始化时隐藏 UI
(add-to-list 'initial-frame-alist '(visibility . icon))

;; 初始化完成后显示 UI
(add-hook 'window-setup-hook #'make-frame-visible)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;;;;==================================================
;;;; GC 设置
;;;;==================================================
;; 设置GC阈值，防止在启动时GC，影响启动速度。
(setq gc-cons-threshold (* 1024 1024 126))
;; (setq garbage-collection-messages t)    ;显示GC信息
;; (setq gc-cons-percentage 0.1)          ;GC
;; 空闲15秒后进行GC
(run-with-idle-timer 15 t #'garbage-collect)
;; 失去焦点后进行GC
(add-hook 'focus-out-hook #'garbage-collect)

;; 初始化后重新设置GC阈值
(add-hook 'emacs-startup-hook (lambda()
                                (setq gc-cons-threshold (* 1024 1024 2))))

;;;;==================================================
;;;; 其他设置
;;;;==================================================
;; Emacs在加载文件时会通过‘file-name-handler-alist’ 加载对应的处理程序。启动时设置为空。启动完成后重新设置。
(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

;; 启动后重新设置一些在启动时修改的选项
(add-hook 'emacs-startup-hook (lambda ()
                                ;; 重新设置‘file-name-handler-alist’
                                (setq file-name-handler-alist file-name-handler-alist-original)
                                (makunbound 'file-name-handler-alist-original)))
;; 禁止启动后激活已经安装的包
(setq package-enable-at-startup nil)
;; ‘site-run-file’ 包含一些初始值。这个文件会在 ‘~/.emacs’ 之前加载。
(setq site-run-file nil)

(provide 'early-init)
