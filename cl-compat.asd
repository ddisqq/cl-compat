;;;; cl-compat.asd - SBCL compatibility layer
;;;; Copyright (c) 2024-2026 Parkian Company LLC
;;;; License: BSD-3-Clause

(asdf:defsystem #:cl-compat
  :description "SBCL compatibility layer for threading, sockets, UUID, and UTF-8"
  :author "Parkian Company LLC"
  :license "BSD-3-Clause"
  :version "1.0.0"
  :serial t
  :components ((:file "package")
               (:module "src"
                :serial t
                :components ((:file "features")
                             (:file "threading")
                             (:file "sockets")
                             (:file "uuid")
                             (:file "utf8")))))
