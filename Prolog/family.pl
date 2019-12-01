/*
Program to establish family relationships between persons
Source of the data:
    https://dragonball.fandom.com/wiki/Bardock
Gilberto Echeverria
02/10/2019
*/

% Facts

father(goku, gohan).
father(goku, goten).
father(bardock, goku).
father(bardock, raditz).
father(vegeta, trunks).
father(vegeta, bulla).
mother(gine, goku).
mother(gine, raditz).
mother(chichi, gohan).
mother(chichi, goten).
mother(bulma, trunks).
mother(bulma, bulla).
male(bardock).
male(goku).
male(vegeta).
male(gohan).
male(goten).
male(trunks).
female(gine).
female(chichi).
female(bulma).
female(bulla).

% Rules 
brothers(X, Y) :-
    X \= Y,
    father(Z, X),
    father(Z, Y),
    mother(W, X),
    mother(W, Y).

brother(X, Y) :-
    brothers(X, Y),
    male(X).

sister(X, Y) :- 
    brothers(X, Y),
    female(X).

grandfather(X, Y) :-
    (father(Z, Y); mother(Z, Y)),
    father(X, Z),
    male(Z).

grandmother(X, Y) :-
   (mother(Z, Y); father(Z, Y)),
    mother(X, Z),
    female(Z).

grandchild(X, Y) :-
    grandfather(Y, X);
    grandmother(Y, X).

grandson(X, Y) :-
    grandchild(X, Y),
    male(X).

granddauther(X, Y) :-
    grandchild(X, Y),
    female(X).