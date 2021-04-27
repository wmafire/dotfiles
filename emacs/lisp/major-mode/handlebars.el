(use-package
  handlebars-mode
  :ensure t
  :defer t
  :mode ("\\.hbs\\'" . handlebars-mode)
  :interpreter ("handlebars" . handlebars-mode))
;;{{{
;;}}}

(provide 'major-mode/handlebars)
