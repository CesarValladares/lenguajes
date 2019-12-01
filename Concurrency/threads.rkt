#|
    First Example using threads in Racket
|#

#lang racket

(define (main)

    (display "main thread\n")
    ; Run the thread
    (thread (lambda () (display "thead 1\n")))
    (thread (lambda () (display "thead 2\n")))
    (thread (lambda () (display "thead 3\n")))
    (thread (lambda () (display "thead 4\n")))
    (display "Main thread finishing\n")
)