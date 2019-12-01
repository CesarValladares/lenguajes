(define (factorial n) 
    (if (< n 1) 
        1                           ; when true
        (* n (factorial(- n 1)))    ; when false
    )
)

(factorial 3)