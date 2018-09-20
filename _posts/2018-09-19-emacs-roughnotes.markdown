---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: emacs, half-baked
---
Emacs ROUGH NOTES
=================

rust
----

enable rust mode install rust mode flycheck rust add hooks

OS X
----

    ;;osx fixes for utf8
    (set-terminal-coding-system 'utf-8)
    (set-keyboard-coding-system 'utf-8)
    (prefer-coding-system 'utf-8)

MELPA
-----

    ;;add melpa packages
    (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
    )

UI
--

    (menu-bar-mode -1)

Junk
----

    ;;(require 'butler) 
    ;;(add-to-list 'butler-server-list 
    ;; '(jenkins "54.154.231.2" 
    ;; (server-address . "http://54.154.231.2:8090") 
    ;; (server-user . "user") 
    ;; (server-password . "pass"))) 

    (add-to-list 'exec-path "/usr/local/bin")
    ;;(setq epa-file-encrypt-to "anthony.hutchison@rga.com") 

    ;;;; eclim 

    ;;(require 'eclim) 
    ;;(global-eclim-mode) 
    ;;(require 'eclimd) 
    ;;;; regular auto-complete initialization 
    ;;(require 'auto-complete-config) 
    ;;(ac-config-default) 

    ;;;; add the emacs-eclim source 
    ;;(require 'ac-emacs-eclim-source) 
    ;;(ac-emacs-eclim-config) 
    ;;(require 'company) 
    ;;(require 'company-emacs-eclim) 
    ;;(company-emacs-eclim-setup) 
    ;;(global-company-mode t) 

    ;;(custom-set-variables 
    ;; '(eclim-eclipse-dirs '("~/eclipse")) 
    ;; '(eclim-executable "~/eclipse/eclim")) 

    ;;;; end eclim 

Packages
--------

Useful packages

org; aka org-mode butler; jenkins integration auto-complete crontab-mode
dockerfile-mode egg; git eclim; could not get this working feature-mode;
gherkin git git-timemachine javap-mode jenkins-watch jira malabar-mode;
jvm integration marcopolo; docker integration markdown-mode
maven-test-mode mvn nexus nginx-mode olivetti s; string manipulation
library ssh ssh-config-mode with-editor

more packages; flycheck

built-ins; epg flymake

package management
------------------

M-x package-refresh-contents

M-x list-packages move up/down, press I to select to install, press X to
execute and confirm with yes to install the packages.

keys
----

does not work: bind right option key on mac to 'super' so we can use s-u
(undo)

    ;; this works, in brew emacs
    C-x @ s u

    ;; this might work in xemacs / aquamacs
    (setq ns-right-option-modifier `super)
