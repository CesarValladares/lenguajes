#|
    Example of using semaphores to control threads
    César Armando Valladares Martínez
|#

#lang racket

; Create a new semaphore
(define semaphore-out (make-semaphore 1))

; Create new thread
(define (make-thread name)
    (thread (lambda ()
                (let loop 
                    ([n 0])
                    (if (< n 10)
                        ; True
                        (begin 
                            (sleep (random))
                            (call-with-semaphore semaphore-out)
                            (printf "Thread: ~a | Counter: ~a \n" name n)
                            (loop (+ n 1)))
                            ; False
                        (printf "thread ~a finishing\n" name)
                    )
                )
    ))
)

; Main function to test
(define (main)
    (printf "MAIN THREAD STARTING\n")
    (define threads (map make-thread '(A B C D E)))
    ; Apply a function to each element in a list, without results
    (for-each thread-wait threads)
    (printf "MAIN THREAD FINISHING")
)