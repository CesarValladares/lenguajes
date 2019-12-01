#|

Homework

César Armando Valladares Martínez

A01023506

|#

#lang racket

(define (play rnum count)

    (define ncount (+ 1 count))             ; Iterate the tries
    (printf "\nEnter your guess")           
    (define nguess (read))                  ; Read the number from the user
    
    (cond 

        [
            (equal? nguess rnum)    ; If the user guess the number                                      
            (printf "Congratulations, you won after ~a tries" ncount)
        ] 
        [
            (> nguess rnum)         ; If the users number is higher                                           
            (printf "Enter a lower number") 
            (play rnum ncount)
        ]             
        [
            (< nguess rnum)         ; If the users number is lower 
            (printf "Enter a higher number") 
            (play rnum ncount)
        ]            
    )
)

(define (guess-game max)                        ; Main function to start the game
    (define rnum (random max))                  ; Generate the randon number
    (printf "WELCOME TO THE NUMBER GUESS GAME")
    (play rnum 0)                               ; Call the recursive function starting with 0 tries
)