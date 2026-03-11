# cl-compat

SBCL compatibility layer providing a consistent API for threading, sockets, UUIDs, and UTF-8.

## Features

- Unified threading API wrapping sb-thread
- Socket operations wrapping sb-bsd-sockets
- UUID generation (v4 random)
- UTF-8 encoding/decoding
- Feature detection macros
- Zero external dependencies

## Installation

```lisp
(asdf:load-system :cl-compat)
```

## Usage

### Threading

```lisp
(use-package :cl-compat)

;; Create and start a thread
(make-thread (lambda () (do-work)) :name "worker")

;; Get current thread
(current-thread)

;; Thread-local bindings
(with-thread-bindings ((*special* value))
  (make-thread #'worker))

;; Locks
(let ((lock (make-lock "my-lock")))
  (with-lock-held (lock)
    (critical-section)))

;; Condition variables
(let ((cv (make-condition-variable))
      (lock (make-lock)))
  (with-lock-held (lock)
    (condition-wait cv lock)
    (condition-notify cv)))
```

### Sockets

```lisp
;; TCP client
(with-tcp-connection (socket "example.com" 80)
  (socket-send socket "GET / HTTP/1.0\r\n\r\n")
  (socket-receive socket))

;; TCP server
(let ((server (make-tcp-server 8080)))
  (loop for client = (accept-connection server)
        do (handle-client client)))

;; UDP
(let ((socket (make-udp-socket)))
  (udp-send socket data host port)
  (udp-receive socket))
```

### UUID

```lisp
;; Generate UUID v4
(make-uuid)
;; => "550e8400-e29b-41d4-a716-446655440000"

;; Parse UUID string
(parse-uuid "550e8400-e29b-41d4-a716-446655440000")

;; UUID as bytes
(uuid-bytes (make-uuid))
```

### UTF-8

```lisp
;; Encode string to UTF-8 bytes
(utf8-encode "Hello, world!")

;; Decode UTF-8 bytes to string
(utf8-decode #(72 101 108 108 111))

;; String length in UTF-8 bytes
(utf8-length "Hello")
```

### Feature Detection

```lisp
;; Check capabilities
(when-feature :threads
  (make-thread #'worker))

(if-feature :64-bit
  (use-64-bit-ops)
  (use-32-bit-ops))
```

## API Summary

### Threading
- `make-thread`, `current-thread`, `thread-alive-p`, `join-thread`
- `make-lock`, `with-lock-held`, `acquire-lock`, `release-lock`
- `make-condition-variable`, `condition-wait`, `condition-notify`

### Sockets
- `make-tcp-socket`, `make-tcp-server`, `accept-connection`
- `socket-connect`, `socket-send`, `socket-receive`, `socket-close`
- `make-udp-socket`, `udp-send`, `udp-receive`

### UUID
- `make-uuid`, `parse-uuid`, `uuid-bytes`, `uuid-string`

### UTF-8
- `utf8-encode`, `utf8-decode`, `utf8-length`

## License

BSD-3-Clause. Copyright (c) 2024-2026 Parkian Company LLC.
