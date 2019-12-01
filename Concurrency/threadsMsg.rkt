#lang racket

(define (counter-fun)
    (let loop ([n 0])
        (if (equal? (thread-receive) 'hello)
            (begin 
                (printf "Iteration ~a in therad\n" n)
                (sleep 0.2)
                (loop))
            (printf "Thread finishing\n"))))

(define (main)
    (display "The main thread\n")
    (define counter (thread counter-fun))
    (let loop 
        ([n 0])
        (if (< n 10)
            (begin 
                (thread-send counter 'hello)
                (loop (+ n 1)))
                (thread-send counter 'finish)))
    ; Main thread waits for the thread to finish
    ; (thread-wait counter)
    ; Main thread terminates the thread early
    (sleep 1)
    (kill-thread counter)
    (display "Main thread finishing\n"))