/*
Homewokr 6 Prolog Basic
César Armando Valladares Martínez
A01023506
*/

% 1 ------------------------
% Take two arguments, a list and an element, and determine if the element can be found inside the list
% Base Case
in_list([H|_], H). % If number is equal to Header of current list

% Recusrive
in_list([_|T], X):-
    in_list(T, X).

% 2 ------------------------
% Take as argument a list, and determine if the list has an odd number of elements or not 
% Base Case
if_odd_length([], X):-
    \+ (0 is mod(X,2)). % If odd length

%Recusrive
if_odd_length([_|T], X):-
    X1 is X + 1,
    if_odd_length(T, X1).

% Main Case
odd_length(L):-
    if_odd_length(L,0).

% 3 ------------------------
% Take as argument an index and a list, and return the element at index n of the list. Indices start at 0

% Base Case
get_element_at(X, [H|_], H, X). % if X is equal to Counter

% Recusive
get_element_at(X, [_|T], N, C):-
    C1 is C +1, % Update counter
    get_element_at(X, T, N, C1).

% Main Case 
element_at(X, L , N):-
    get_element_at(X, L, N, 0). % start couter at 0

% 4 ------------------------
%  Take two lists as arguments, and determine if they are permutations of each other. That is, they have the exact same elements, but in different orders

% Recusive Case
is_permutation(L, [H | T]):-
    in_list(L, H),
    is_permutation(L, T).

% Base Case
is_permutation(_, []). % When second list is empty

% 4 ------------------------
% Take as argument a list, and generate a list without contiguous elements that are duplicated

% Base case
tec_remove_doubles([], []). % When main list is empty

% Recusive 
tec_remove_doubles([H|[H|T]], R):-
    tec_remove_doubles([H|T], R).

tec_remove_doubles([H|T], [H|R]):-
    tec_remove_doubles(T, R).


