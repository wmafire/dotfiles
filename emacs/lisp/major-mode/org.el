;;; package -- org-config
;;; Commentary:
;;; Code:

(use-package
  org
  :ensure org-plus-contrib
  :custom-face          ;
  ;; (org-block ((t
  ;;              (:background nil
  ;;                           :slant italic))))
  ;; (org-block-begin-line ((t
  ;;                         (:background nil
  ;;                                      :slant italic))))
  ;; (org-block-end-line ((t
  ;;                       (:background nil
  ;;                                    :slant italic))))
  :config                               ;
  (require 'ob-dot)
  ;; (require 'ob-plantuml)
  (require 'ob-python)
  (require 'ob-shell)
  (require 'ob-java)
  (require 'ob-js)
  (require 'ob-python)
  (require 'ob-latex)
  (require 'ox-freemind)
  (require 'org-tempo)
  (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
  (add-hook 'org-mode-hook (lambda ()
                             (if (fboundp 'org-display-inline-images)
                                 (org-display-inline-images t t))
                             (if (fboundp 'org-indent-mode)
                                 (org-indent-mode))
                             (setq truncate-lines nil)
                             (setq left-margin-width 2)
                             (setq right-margin-width 5)))
  ;; (setq org-image-actual-width '(100 200 300))
  (setq-default org-confirm-babel-evaluate nil))

(use-package
  ob-plantuml
  :init (setq-default org-plantuml-exec-mode 'plantuml)
  (setq-default org-plantuml-jar-path ""))

(use-package
  evil-org
  :ensure t
  :after org
  :hook (org-mode . evil-org-mode)
  :config                               ;
  (add-hook 'evil-org-mode-hook (lambda ()
                                  (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package
  org-superstar
  :ensure t
  :hook (org-mode . org-superstar-mode)
  :init                                 ;
  (setq org-superstar-prettify-item-bullets nil))


(use-package
  org-roam
  :ensure t
  :hook (after-init . org-roam-mode)
  :custom                               ;
  (org-roam-directory "~/Storage/Nutstore/Notes")
  (org-roam-index-file "Index.org")
  (org-roam-title-sources '((title headline) alias))
  (org-roam-tag-sources '(vanilla))
  :config                               ;
  (w/create-leader-key "d" 'org-roam-jump-to-index "index" major-map-prefix)
  (w/create-leader-key-for-mode 'org-mode "n" 'org-roam "backlink" major-map-prefix)
  (w/create-leader-key-for-mode 'org-mode "f" 'org-roam-find-file "find-file" major-map-prefix)
  (w/create-leader-key-for-mode 'org-mode "n" 'org-roam-graph "graph" major-map-prefix)
  (w/create-leader-key-for-mode 'org-mode "i" 'org-roam-insert "insert" major-map-prefix)
  (w/create-leader-key-for-mode 'org-mode "I" 'org-roam-insert-immediate "insert-immediate" major-map-prefix)
  (require 'org-roam-protocol)
  (setq org-roam-capture-templates '(("d" "default" plain #'org-roam-capture--get-point "%?"
                                      :file-name "${slug}-%<%y%m%d%H%M%S>"
                                      :head "* ${title} \n"
                                      :unnarrowed t)))
  (setq org-roam-capture-immediate-template '("d" "default" plain #'org-roam-capture--get-point "%?"
                                              :file-name "${slug}-%<%y%m%d%H%M%S>"
                                              :head "* ${title} \n"
                                              :unnarrowed t)))
(use-package
  deft
  :ensure t
  :after org
  :bind ("C-c n d" . deft)
  :custom (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory "~/Storage/Nutstore/Notes"))

(use-package
  org-roam-server
  :ensure t
  :config (setq org-roam-server-host "127.0.0.1" org-roam-server-port 8010
                org-roam-server-authenticate nil org-roam-server-export-inline-images t
                org-roam-server-serve-files nil org-roam-server-served-file-extensions '("pdf" "mp4"
                                                                                         "ogv")
                org-roam-server-network-poll t org-roam-server-network-arrows nil
                org-roam-server-network-label-truncate t
                org-roam-server-network-label-truncate-length 60
                org-roam-server-network-label-wrap-length 20))


(provide 'major-mode/org)
;;; org-config.el ends here
