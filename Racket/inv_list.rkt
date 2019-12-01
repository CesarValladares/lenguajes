#|

Inv List

César Armando Valladares Martínez

12-sep-2019
|#

(define (invert-list numbers)
    (if (list? numbers)
        (append 
            (invert-list (cdr numbers))
            (list (car numbers))
        )
        (display "empty")
    )
)