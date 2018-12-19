;; (require \'asdf)
 
 (in-package :cl-user)
 (defpackage nippo-manager-asd
 (:use :cl :asdf))
 (in-package :nippo-manager-asd)
 
 (defsystem :nippo-manager
 :version "1.0.0"
 :author "wasu"
 :license "MIT"
 :components ((:file "package")
 (:module "src" :components ((:file "nippo-manager")))))

