/*
    Lists in prolog
*/

% Last element un list 
% Base case, a list with only one element
tec_last([H | []], H).

% Recursive case
tec_last([_|T], L) :-
    tec_last(T, L).

% Length of a list with tail
% Base Case
tec_length([_| []], L, L).

% Recursive case 
tec_length([_|T], A, L):-
    A1 is A + 1,
    tec_length(T,A1,L).

% Another option 
tec_length([], 0).

%Recursive
tec_length([_|T], L):-
    tec_length(T, L1),
    L is L1 + 1.

% Reverse a list
tec_reverse(L, R) :-
    reverse_helper(L, R, []).

% Base case
reverse_helper([], R, R).

% Recursive 
reverse_helper([H|T], R, A):-
    reverse_helper(T, R, [H|A]).

% Append two lists
% Base case
tec_append([], L, L).

% Recusive
tec_append([H1| T1], L2, [H1|R]):-
    tec_append(T1, L2, R).

% Double the elements of a list
% Base case
double_elements([], []).

% Recursive rule
double_elements([H|T], [X|R]) :-
    X is H * 2,
    double_elements(T, R).


% Flatten not list item into a list 
tec_flatten(X, [X]):-
    % Not is used a not probable
    \+ is_list(X).

% Flatten a list that may contain other lists 
tec_flatten([],[]).

tec_flatten([H|T], R):-
    % is_list(H),
    tec_flatten(H, FlatHead),
    tec_flatten(T, FlatTail),
    append(FlatHead, FlatTail, R).