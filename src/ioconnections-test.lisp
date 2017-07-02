
















;; This is ultimately the call the the slave used to connect to the
;; server swank-like session.
(defparameter socket
  (iolib.sockets:make-socket :address-family :ipv4
			     :connect :active
			     :type :stream
			     :remote-host "localhost"
			     :remote-port 9001))


;; used by the server
;;
;; Roughly speaking (going from my recolection of
;; ioconnections.lisp:313 -- initialize-instance ((server-instance listening-connection/iolib))
;; ioconnections.lisp:340 -- set-iolib-server-handlers (connection-instance)
;; connections.lisp:525 -- process-incoming-connection (listener)
;; ioconnections.lisp:379 -- convert-pending-connection  ((connection tcp-listener/iolib))






;;;
;; iolib
iolib:event-base
iolib:event-dispatch
iolib:remove-fd-handlers
iolib:set-io-handler
iolib:with-event-base

;; iolib.multiplex
iolib.multiplex::fd-handler-one-shot-p
iolib.multiplex:add-timer
iolib.multiplex:fd-readablep
iolib.multiplex:select-multiplexer

;; iolib.sockets
iolib.sockets:+ipv4-unspecified+
iolib.sockets::%accept
iolib.sockets::sockaddr-storage->sockaddr
iolib.sockets::with-sockaddr-storage-and-socklen
iolib.sockets:ensure-hostname
iolib.sockets:make-socket
iolib.sockets:socket-os-fd

;; iolib.streams
iolib.streams:fd-of

;; iolib.sockets
iolib.sockets:+ipv4-unspecified+
iolib.sockets::%accept
iolib.sockets::sockaddr-storage->sockaddr
iolib.sockets::with-sockaddr-storage-and-socklen
iolib.sockets:ensure-hostname
iolib.sockets:make-socket
iolib.sockets:socket-os-fd


iolib.multiplex::fd-handler-one-shot-p
iolib.multiplex:add-timer
iolib.multiplex:fd-readablep
iolib.multiplex:select-multiplexer
iolib.sockets:
iolib.sockets:+ipv4-unspecified+
iolib.sockets::%accept
iolib.sockets::sockaddr-storage->sockaddr
iolib.sockets::with-sockaddr-storage-and-socklen
iolib.sockets:make-socket
iolib.sockets:make-socket
iolib.sockets:socket-os-fd
iolib.sockets:socket-os-fd
iolib.streams:fd-of
iolib.streams:fd-of


;; isys
isys::exit
isys:chdir
isys:close
isys:dup2
isys:eio
isys:eloop
isys:enoent
isys:enxio
isys:etimedout
isys:ewouldblock
isys:execvp
isys:fork
isys:getcwd
isys:getenv
isys:ioctl
isys:kill
isys:lstat
isys:mkdir
isys:mkstemp
isys:o-rdwr
isys:open
isys:pipe
isys:read
isys:rename
isys:rmdir
isys:s-ifdir
isys:s-ifmt
isys:setsid
isys:stat
isys:stat-mode
isys:stat-mtime
isys:stat-nlink
isys:stat-size
isys:stat-uid
isys:unlink
isys:write
