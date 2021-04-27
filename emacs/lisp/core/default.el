;;; package -- default
;;; Commentary:
;;; Code:


;;;; 用户信息

;;;;==================================================
;;;;用户信息
;;;;==================================================
(setq user-full-name "walter")
(setq user-mail-address "ismrwalter@gmail.com")

;;;;==================================================
;;;; Emacs行为
;;;;==================================================

;; UI控件设置
(menu-bar-mode -1)                          ; 隐藏菜单
(tool-bar-mode -1)                          ; 隐藏工具栏
(scroll-bar-mode -1)                        ; 隐藏滚动条
(setq mouse-highlight nil)                  ; 禁止鼠标悬浮高亮
(setq-default frame-title-format " %b ") ; 设置窗口标题格式
(setq-default use-dialog-box nil)           ; 不显示对话框
(set-frame-parameter nil 'alpha 100)        ; 设置窗口透明度
;; 定义自动换行标识
(define-fringe-bitmap 'right-curly-arrow [#b00101010 ;
                                          #b00000000 ;
                                          #b00000010 ;
                                          #b00000000 ;
                                          #b00000010 ;
                                          #b00000000 ;
                                          #b00000010 ;
                                          #b00000000 ;
                                          #b00010010 ;
                                          #b00100000 ;
                                          #b01111110])
;; 设置自动换行标识
(define-fringe-bitmap 'left-curly-arrow [#b00000000])
;; (cua-mode 1)                            ; 开启CUA模式
;; 开启窗口UNDO-REDO
(winner-mode t)
;; 编辑备份设置
(defconst backup-file-directory (expand-file-name "backup" m/misc-file-directory))
(make-directory backup-file-directory t) ; 创建备份文件目录
(setq backup-directory-alist `(("." . ,backup-file-directory))) ; 设置备份目录
(setq version-control t)                ; 启动备份版本控制
(setq vc-make-backup-files t)           ; 创建版本控制备份文件
(setq delete-old-versions -1)           ; 删除旧的版本
;; 自动保存设置
(setq auto-save-file-name-transforms  `((".*" ,backup-file-directory t))) ;自动保存命名规则
(setq auto-save-list-file-prefix backup-file-directory) ;自动保存文件路径

(setq ring-bell-function 'ignore)         ; 关闭光标警告
(setq shift-select-mode nil)              ; 禁止双击 shift 选择
;; 启动屏幕
(setq-default inhibit-splash-screen 1)    ; 不显示启动屏幕
(setq-default initial-scratch-message "") ; 将 Scratch 的内容设为空

(setq read-process-output-max (* 1024 1024)) ; 设置Emacs每次从进程读取的最大数据量
(fset 'yes-or-no-p 'y-or-n-p)                ; 用 y/n 代替 yes/no
;; (desktop-save-mode 1)                 ; 自动保存环境
(setq ad-redefinition-action 'accept)   ; 禁止redefine warning

;; 保存光标位置
(setq save-place-file (expand-file-name "palces" m/misc-file-directory))
(save-place-mode 1)

;; 保存最近打开的文件
(setq recentf-save-file (expand-file-name "recentf" m/misc-file-directory))
(recentf-mode 1)

;; 滚动行为
(setq scroll-conservatively 10000)               ; 滚动时保持光标位置
(setq scroll-step 1)                             ; 滚动行数
(setq scroll-margin 5)                           ; 滚动光标边距
(setq hscroll-step 1)                            ; 水平滚动列数
(setq hscroll-margin 10)                         ; 水平滚动光标边距
(setq-default mouse-wheel-progressive-speed nil) ; 设置鼠标滚动速度

;; Minibuffer
(savehist-mode 1)                       ; 开启Minibuffer历史记录
(setq echo-keystrokes 0.1)              ; 显示未完成的按键命令
(setq-default history-length 500)       ; Minibuffer 历史长度
(setq-default enable-recursive-minibuffers nil) ; 禁止递归 Minibuffer
;; (setq-default minibuffer-prompt-properties '(read-only t point-entered minibuffer-avoid-prompt
;;                                                        face))
;; 自动关闭minibuffer
(add-hook 'mouse-leave-buffer-hook (lambda()
                                     (when (and (>= (recursion-depth) 1)
                                                (active-minibuffer-window))
                                       (abort-recursive-edit))))

;; 字体
(defun m/set-font(fontsize)
  "Try to config font"
  ;; 设置默认字体
  (let ((frame-font (cond ((member "Sarasa Mono SC" (font-family-list)) "Sarasa Mono SC")
                          ((member "Consolas" (font-family-list)) "Consolas")
                          ((member "Menlo" (font-family-list)) "Menlo")
                          ((member "DejaVu Sans Mono" (font-family-list)) "DejaVu Sans Mono")
                          ((member "WenQuanYi Micro Hei Mono" (font-family-list))
                           "WenQuanYi Micro Hei Mono"))))
    (set-frame-font (format "%s-%s" frame-font fontsize) t t))

  ;; 中文字体
  (set-fontset-font t '(#x4e00 . #x9fff)
                    (cond ((member "Sarasa Mono SC" (font-family-list)) "Sarasa Mono SC")
                          ((member "WenQuanYi Micro Hei" (font-family-list)) "WenQuanYi Micro Hei")
                          ((member "Microsoft YaHei" (font-family-list)) "Microsoft YaHei")
                          ((member "Hei" (font-family-list)) "Hei")
                          ((member "WenQuanYi Micro Hei Mono" (font-family-list))
                           "WenQuanYi Micro Hei Mono")))
  ;; 设置Emoji字体
  (set-fontset-font t '(#x1f300 . #x1fad0)
                    (cond ((member "Noto Color Emoji" (font-family-list)) "Noto Color Emoji")
                          ((member "Noto Emoji" (font-family-list)) "Noto Emoji")
                          ((member "Segoe UI Emoji" (font-family-list)) "Segoe UI Emoji")
                          ((member "Symbola" (font-family-list)) "Symbola")
                          ((member "Apple Color Emoji" (font-family-list)) "Apple Color Emoji"))))
(m/set-font m/fontsize)
;; C/S 模式需要再次设置字体
(add-hook 'server-after-make-frame-hook (lambda ()
                                          (m/set-font m/fontsize)))
;; 主题样式
(defun m/ui-ajust()
  "调整主题样式"

  (set-face-attribute 'fringe nil
                      :foreground "#fc5c59")
  ;; 设置垂直窗口边框(目前发现只在终端有效)
  ;; (set-face-inverse-video-p 'vertical-border nil)
  (set-face-foreground 'vertical-border (face-background 'default))
  (set-face-background 'vertical-border (face-background 'default))
  (set-display-table-slot standard-display-table 'vertical-border (make-glyph-code ?!))
  ;; Modeline
  (set-face-background 'mode-line-inactive nil)
  (set-face-background 'mode-line nil)
  (setq underline-minimum-offset 5))

(add-hook 'after-init-hook 'm/ui-ajust)
(add-hook 'server-after-make-frame-hook 'm/ui-ajust)
;;;;==================================================
;;;; 编辑行为
;;;;==================================================
;; TAB 设置
(setq-default tab-width 4)                 ; Tab Width
(setq-default indent-tabs-mode nil)        ; 关闭 Tab 缩进
(setq-default tab-always-indent 'complete) ; Tab键优先缩进，然后补全

(setq-default select-enable-clipboard t) ; 启用系统剪切板

;; (global-display-line-numbers-mode)

(setq display-line-numbers-type 'relative)            ; 使用相对行号
(setq display-line-numbers-width-start 5)             ; 行号宽度
(setq-default display-line-numbers-width 5)
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ; 显示行号
(global-hl-line-mode t)                 ; 高亮当前的行
(delete-selection-mode 1)               ; 插入时替换选区
(electric-pair-mode t)                  ; 自动输入括号
(electric-quote-mode t)                 ; 自动输入引号
(electric-indent-mode 1)                ; 回车时使用缩进

(defun m/clear-whitespace()
  "清除文件中的空格"
  (whitespace-cleanup)
  (delete-trailing-whitespace))
(add-hook 'before-save-hook 'm/clear-whitespace)

;;;;==================================================
;;;; 文件
;;;;==================================================
(setq load-prefer-newer t)              ; 加载最新的文件
(setq-default create-lockfiles nil)     ; 不要锁定文件
(global-auto-revert-mode t)             ; 开启重新加载被修改的文件
(auto-compression-mode t)               ; 压缩文件支持
(global-so-long-mode 1) ; 打开长行文件时可能会导致严重的性能问题，可以自动关闭一些可能会导致这一问题的功能

;; 字符编码
;; (prefer-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
;; 优化 Dired mode
(setq dired-recursive-deletes 'always)       ;递归删除
(setq dired-recursive-copies 'always)        ;递归复制
(setq global-auto-revert-non-file-buffers t) ;自动刷新
(setq auto-revert-verbose nil)               ;不显示多余的信息
(setq dired-dwim-target t)                   ;快速复制和移动
(setq delete-by-moving-to-trash t)           ;删除文件到trash
(put 'dired-find-alternate-file 'disabled nil) ;重新使用已经存在dired buffer
(with-eval-after-load 'dired (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
                      (define-key dired-mode-map (kbd "<return>") 'dired-find-alternate-file)
                      (define-key dired-mode-map (kbd "^")
                        (lambda ()
                          (interactive)
                          (find-alternate-file ".."))))

(provide 'core/default)
;;; default.el ends here
