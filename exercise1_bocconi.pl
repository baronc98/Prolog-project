% exercise 1: Nel mazzo di 52 carte ve ne sono 26 rosse e 26
% nere. Il mazzo viene separato in due mazzetti: il
% primo di 25 carte, il secondo di 27.
% Se il primo mazzetto contiene 12 carte rosse,
% quante carte nere ci sono nel secondo
% mazzetto?


% Nc is the total number of cards
% Nfd is the number of cards in first deck
% Nfdred is the number of red cards in first deck
% Black_cards is the variable which will contain the answer: black cards in second deck

:- use_module(library(clpfd)).

n_cards(Nc, Nfd, Nfdred, Black_cards) :-
	0 is Nc mod 2,
    Nfd < Nc,
    Nfdred < Nfd,
    Black_cards is ((Nc / 2) - (Nfd - Nfdred)).


% n_cards(52, 25, 12, Black_cards). 