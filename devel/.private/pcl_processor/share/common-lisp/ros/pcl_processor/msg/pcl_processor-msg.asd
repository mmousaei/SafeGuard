
(cl:in-package :asdf)

(defsystem "pcl_processor-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "safeguard" :depends-on ("_package_safeguard"))
    (:file "_package_safeguard" :depends-on ("_package"))
  ))