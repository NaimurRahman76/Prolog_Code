love(hena,raja).
sing_a_song(ananya).
listens_to_music(rohit).

listens_to_music(ananya) :- sing_a_song(ananya).
happy(ananya) :- sing_a_song(ananya).
happy(rohit) :- listens_to_music(rohit).
playes_guitar(rohit) :- listens_to_music(rohit).

can_cook(priya).
can_cook(jaya).
can_cook(tiyasha).

likes(priya,jaya) :- can_cook(jaya).
likes(priya,tiyasha) :- can_cook(tiyasha).



parent(niamot,naim).
parent(niamot,rani).
parent(niamot,maria).

parent(majed,naim).
parent(majeda,rani).
male(niamot).
male(naimur).
male(joy).
parent(majeda,maria).
brother(X,Y):- parent(Z,X),parent(Z,Y),male(X),male(Y).
father(X,Y):- male(X),parent(X,Y).
max(P,Q,R):-P>Q,P>R,write('Larger number is '),write(P).
max(P,Q,R):-P<Q,Q>R,write('Larger number is '),write(Q).
max(P,Q,R):-R>Q,P<R,write('Larger number is '),write(R).



min(P,Q,R):-P<Q,P<R,write('Smallest number is '),write(P).
min(P,Q,R):-P>Q,Q<R,write('Smallest number is '),write(Q).
min(P,Q,R):-R<Q,P>R,write('Smallest number is '),write(R).


find(X,[X|_]).
find(X,[_|TAIL]):-find(X,TAIL).

merge([],L2,L2).
merge([H|T],L2,[H|T3]):-merge(T,L2,T3).



rev([],[]).
rev([Head|Tail],Reversed) :- rev(Tail, RevTail),merge(RevTail, [Head],Reversed).






factorial(0, 1).
factorial(N, F) :-
        N > 0,
        N1 is N - 1,
        factorial(N1, F1),
        F is N * F1.





is_leap_year(Year) :-
    (Year mod 400 =:= 0 -> true ;
    (Year mod 100 =:= 0 -> false ;
    (Year mod 4 =:= 0 -> true))).



read_file(File) :-
    open(File, read, Stream),
    read_lines(Stream),
    close(Stream).

read_lines(Stream) :-
    at_end_of_stream(Stream), !.

read_lines(Stream) :-
    read_line(Stream, Line),
    write(Line), nl,
    read_lines(Stream).

read_line(Stream, Line) :-
    get_char(Stream, Char),
    (Char = '\n' -> Line = "" ;
     (Line = [Char|Rest], read_line(Stream, Rest))).



















