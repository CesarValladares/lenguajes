#|

Homework prime numbers

César Armando Valladares Martínez

A01023506

|#

; Function that return false if the number is not prime or true if is prime
(define (prime? number)
    (if (< number 2)   ; Filter to check if the number is 1 or 0
        #t
        (let loop ([number number][counter 2])  ; Loop function to divide the number
            (if (equal? number counter)
                #t
                (if (equal? (remainder number counter) 0) ; if counter divides number it's not prime
                    #f
                    (loop number (+ counter 1)) ; Calling loop funcition with new counter
                ) 
            )
        )
    )
)

; Function returns a list containing all the prime numbers smaller than the input
(define (primes-less-than number)
    (let ([results '()])
        (for ([i (- number 1)]) ; Iteration to limit
            (when (prime? (+ 2 i))  ; Start from 2 
                (set! results (append results (list (+ 2 i)))) ; Append to result if the number is prime
            )
        )
        results
    )
)

; Function returns the prime number at that position of the sequence of primes
(define (nth-prime number)
    (let loop ([number number][position 1][prime_n 2]) ; number = target position, position = current position in primes list, prime_n = current prime number
        (if (prime? prime_n)    ; If the number is prime
            (if (equal? number position) ; If the prime number is in the target position
                prime_n
                (loop number (+ 1 position) (+ 1 prime_n)) ; Next prime number
            )
            (loop number position (+ 1 prime_n)) ; Next number 
        )
    )
)