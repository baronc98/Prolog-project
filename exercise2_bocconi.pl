% 2. Il labirinto
% Nel disegno seguente vedete lo schema di un
% labirinto. Massimo entra nel labirinto in alto a
% sinistra (dove c’è la freccia) ed esce a destra (in
% corrispondenza dell’altra freccia), seguendo le
% linee tratteggiate e non passando mai più di una
% volta dallo stesso pallino rosso.
% Sapendo che la distanza tra due pallini è di 10
% metri, qual è la distanza massima che
% Massimo potrà percorrere?

labirinto.png

:- use_module(library(lists)).

% data set of labyrinth

link(one, two).
link(two, three).
link(one, five).
link(two, six).
link(three, seven).
link(four, five).
link(five, six).
link(six, seven).
link(seven, eight).
link(four, nine).
link(five, ten).
link(six, eleven).
link(seven, twelve).
link(eight, thirteen).
link(nine, ten).
link(ten, eleven).
link(eleven, twelve).
link(twelve, thirteen).
link(ten, fourteen).
link(eleven, fifteen).
link(twelve, sixteen).
link(fourteen, fifteen).
link(fifteen, sixteen).

% starting point = 1, ending point = 13
% Visited captures the constraint "only one passage for each point"

path_starting(Visited, Visited_final, Path) :-
    link(one, X),
    not(member(X, Visited)),
    append(Visited, [one, X], Visited_new),
    sub_path(X, _, Visited_new, Visited_final, Path).
    
sub_path(X, thirteen, Visited, Visited_final, Path) :-
    link(X, thirteen),
    not(member(thirteen, Visited)),
    append(Visited, [thirteen], Path),
    length(Path, N),
    Visited_final is (N - 1)*10.					% the -1 remove the +10 of the first insertion 'append([one, X]...' 
										  			% because for the alg it counts 20 but is only one movement  																							
sub_path(X, Y, Visited, Visited_final, Path) :-
    link(X, Y),
    not(member(Y, Visited)),
    append(Visited, [Y], Visited_new),
    sub_path(Y, _, Visited_new, Visited_final, Path).

sub_path(X, Y, Visited, Visited_final, Path) :-
    link(Y, X),
    not(member(Y, Visited)),
    append(Visited, [Y], Visited_new),
    sub_path(Y, _, Visited_new, Visited_final, Path).



% print all solutions
% findall(Visited_final, path_starting([], Visited_final, Path), Sol), max_list(Sol, Max).

% print solutions with path
% path_starting([], Visited_final, Path).  