
(cl:in-package :asdf)

(defsystem "demo-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MPerson" :depends-on ("_package_MPerson"))
    (:file "_package_MPerson" :depends-on ("_package"))
    (:file "Num" :depends-on ("_package_Num"))
    (:file "_package_Num" :depends-on ("_package"))
  ))