remove(_, [], []).
remove(R, [H|T], T2) :- \+ H \= R, remove(R, T, T2).
remove(R, [H|T], [H|T2]) :- H \= R, remove(R, T, T2).


find(X,[X|_]).
find(X,[_|TAIL]):-find(X,TAIL).

merge([],L2,L2).
merge([H|T],L2,[H|T3]):-merge(T,L2,T3).



rev([],[]).
rev([Head|Tail],Reversed) :- rev(Tail, RevTail),merge(RevTail, [Head],Reversed).




add([],X,[X]).
add([H|T],X,[H|L]):-add(T,X,L).


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
    (Char = '\n' -> Line = "";
     (Line = [Char|Rest], read_line(Stream, Rest))).






