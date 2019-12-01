/* 
Trees 
César Valladares
*/

% Relations to store predefined trees
test_tree(1, node(6, node(2, nil, node(5, nil, nil)), node(8, nil, nil))).
% Invalid tree
test_tree(2, node(6, node(2, node(5, nil, nil)), node(8, nil, nil))).
test_tree(3, node(45, node(12, node(3, nil, nil), node(23, nil, nil)), node(52, node(48, nil, nil), node(59, nil, nil)))).

% To determinate if an expression is a valid tree
is_tree(nil).
is_tree(node(_, LT, RT)):-
    is_tree(LT),
    is_tree(RT).

% Search for an element inside the tree.
tree_element(X, node(R, _, _)):-
    X = R.
tree_element(X, node(R, _, RT)):-
    X>R,
    tree_element(X, RT).
tree_element(X, node(R, LT, _)):-
    X<R,
    tree_element(X, LT).

% Insert a new element in the tree, the result is NewTree
% Base case
tree_insert(X, nil, node(X, nil, nil)).
% If the element is already in the tree, do nothing
tree_insert(X, node(R, LT, RT), node(R, LT, RT)) :-
    X = R.
tree_insert(X, node(R, LT, RT), node(R, NLT, RT)) :-
    X < R,
    tree_insert(X, LT, NLT).
tree_insert(X, node(R, LT, RT), node(R, LT, NRT)) :-
    X > R,
    tree_insert(X, RT, NRT).

% Convert a tree into an ordered list
tree_inorder(nil, []).
tree_inorder(node(R, LT, RT), L):-
    tree_inorder(LT, LL),
    tree_inorder(RT, RL),
    append(LL, [R| RL], L).

% Print a nicely formatted tree

print_tree(T):-
    print_tree_aux(T, 0).

print_tree_aux(nil, _):-
    write("").
print_tree_aux(node(R, nil, nil), Depth):-
    tab(Depth),
    write(R),
    nl.
print_tree_aux(node(R, LT, RT), Depth):-
    Depth1 = Depth + 5, 
    print_tree_aux(RT, Depth1),
    tab(Depth),
    write(R),
    nl,
    print_tree_aux(LT, Depth1).

% Delete element from tree.
tree_delete(_, nil, nil).
% Find element
tree_delete(X, node(R, LT, RT), node(R, NLT, RT)):-
    X<R,
    tree_delete(X, LT, NLT).
tree_delete(X, node(R, LT, RT), node(R, LT, NRT)):-
    X>R,
    tree_delete(X, RT, NRT).
% Delete element found
tree_delete(X, node(X, nil, nil), nil).
tree_delete(X, node(X, LT, nil), LT).
tree_delete(X, node(X, nil, RT), RT).
tree_delete(X, node(X, LT, RT), node(Min, LT, NRT)):-
    tree_min(RT, Min),
    tree_delete(Min, RT, NRT).

tree_min(nil, nil).
tree_min(node(R, nil, _), R).
tree_min(node(_, LT, _), Min):-
    tree_min(LT, Min).

% Compute the height of the tree. Two parameters, the tree and the resulting height

% Base Case
tree_height(nil, 0). % If not leafs return 0

tree_height(node(_, LT, RT), H):-
    tree_height(LT, LH),    % Check Left Node
    tree_height(RT, RH),    % Check Right Node
    H is max(LH, RH) + 1.   % Get the highest counter an add 1 to counter

% Generate a list of all the elements at the leafs of the tree (nodes without children). Two parameters, the tree and the resulting list

% Base case
list_leaves(node(R, nil, nil), [R]). % If final node, return a list of 1 with the leaf

list_leaves(nil, []).   % If no node, return an empty list

list_leaves(node(_, LT, RT), R):-
    list_leaves(LT, LL),
    list_leaves(RT, LR),
    append(LL, LR, R).  % Append leaves

% Determine if a tree has the same structure on its left and right branches, inverted. Only parameter is a tree

symmetric_tree(node(_,LT, RT)):-
    mirror_tree(LT, RT).        % Check both children

% Used to solve the previous predicate. Compare two trees to see if they have a mirrored structure. Two arguments, both trees

mirror_tree(node(_, nil, nil), node(_, nil, nil)).  % Last leaf

% Check all posible cases
mirror_tree(node(_, LT, nil), node(_, nil, RT)):-   
    mirror_tree(LT, RT).
mirror_tree(node(_, nil, RT), node(_, LT, nil)):-
    mirror_tree(RT, LT).
mirror_tree(node(_, LT, RT), node(_, LT2, RT2)):-
    mirror_tree(LT, RT2),
    mirror_tree(RT, LT2).