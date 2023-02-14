% Main predicate for handling login attempts
login :-
    % Initialize the counter
    retractall(counter(_)),
    asserta(counter(0)),

    % Loop until the user is either granted access or the maximum number of attempts is reached
    repeat,
    counter(Count),
    (Count < 3 ->
        % Prompt user for username and password
        write('Username: '),
        read(Username),
        write('Password: '),
        read(Password),
        % Check if username and password are valid
        (valid_login(Username, Password) ->
            write('Access granted'), nl,
            retract(counter(_)),
            asserta(counter(0)),
            !
        ;
            % Increment the counter and show message
            NewCount is Count + 1,
            retract(counter(_)),
            asserta(counter(NewCount)),
            write('Access denied'), nl,
            write('Attempts remaining: '),
            RemainingAttempts is 3 - NewCount,
            write(RemainingAttempts), nl
        )
    ).

% Example predicate for checking valid login credentials
valid_login(Username, Password) :-
    (Username == 'admin', Password == 'password')
    ;
    (Username == 'user', Password == 'pass').






