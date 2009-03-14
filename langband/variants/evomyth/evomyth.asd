;;; -*- Mode: Lisp; Syntax: Common-Lisp; Package: cl-user -*-

#|

DESC: variants/evomyth/evomyth.asd - system-def for evomyth
Copyright (c) 2009 - Stig Erik Sand�

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

|#

(in-package :cl-user)

;; we need certain flags
(eval-when (:execute :load-toplevel :compile-toplevel)
  #+(or cmu allegro sbcl lispworks)
  (pushnew :enough-support-for-langband *features*)
  #+(and clisp langband-development) ;; clisp not ready in debian yet
  (pushnew :enough-support-for-langband *features*)
  )

(defpackage :evomyth-system 
  (:use :cl :asdf))

(in-package :evomyth-system)

(asdf:defsystem :evomyth
    :version "0.1.5"
    :components ((:file "package")
		 (:file "base" :depends-on ("package"))
		 (:file "variant" :depends-on ("base"))
		 (:file "levels" :depends-on ("variant"))
		 (:file "creatures" :depends-on ("variant"))
		 (:file "objects" :depends-on ("variant"))
		 (:file "quests" :depends-on ("variant"))
		 (:file "player" :depends-on ("creatures" "quests"))
		 ;;(:file "spells" :depends-on ("variant"))
		 (:file "magic" :depends-on ("variant"))
		 (:file "combat" :depends-on ("variant"))
		 (:file "print" :depends-on ("quests" "combat"))
		 (:file "keys" :depends-on ("print"))
		 (:file "wizard" :depends-on ("keys"))
		 
		 )
    :depends-on (langband-engine lbmodule-dialogue))

#-enough-support-for-langband
(warn "Evomyth has not been tested with '~a ~a', skips compilation."
      (lisp-implementation-type)
      (lisp-implementation-version))
