%% Code based on Eddy Ramirez mathematics and programming
%% classes at https://www.youtube.com/watch?v=cs3TOyAQJXQ&list=PLZ26hi4ZVN-DHGIb8JacmadXFkVEQvpvb

-module(fibonacci).
-export([
    fib/1,
    fibo/1,
    fibm/1,
    vectorAddition/1,
    positionalProduct/2,
    vectorProduct/2,
    transposeMatrix/1,
    matrixProduct/2,
    power/2,
    identity/1,
    powerMatrix/2,
    timing/2
]).

fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(N - 1) + fib(N - 2).

fibo(N) -> fibo(N, 0, 1, 1).
fibo(N, _, Fi, N) -> Fi;
fibo(N, Fi0, Fi, I) -> fibo(N, Fi, Fi0 + Fi, I + 1).

vectorAddition(Vector) -> vectorAddition(Vector, 0).
vectorAddition([], ACC) -> ACC;
vectorAddition([H | T], ACC) -> vectorAddition(T, H + ACC).

positionalProduct([], []) -> [];
positionalProduct([H1 | T1], [H2 | T2]) -> [H1 * H2 | positionalProduct(T1, T2)].

vectorProduct(V1, V2) -> vectorAddition(positionalProduct(V1, V2)).

transposeMatrix([]) -> [];
transposeMatrix([[] | _]) -> [];
transposeMatrix(M) -> [[H || [H | _] <- M] | transposeMatrix([[T] || [_, T] <- M])].

matrixProduct(M1, M2) ->
    M2T = transposeMatrix(M2),
    [[vectorProduct(F1, C2) || C2 <- M2T] || F1 <- M1].

power(_, 0) ->
    1;
power(B, E) when E rem 2 =:= 0 ->
    R = power(B, E div 2),
    R * R;
power(B, E) ->
    R = power(B, E div 2),
    B * R * R.

identity(0) -> [];
identity(N) -> [[1 | [0 || _ <- lists:seq(1, N - 1)]] | [[0 | F] || F <- identity(N - 1)]].

powerMatrix(M, 0) -> identity(length(M));
powerMatrix(M, E) when E rem 2 =:= 0 ->
    R = powerMatrix(M, E div 2),
    matrixProduct(R, R);
powerMatrix(M, E) ->
    R = powerMatrix(M, E div 2),
    matrixProduct(M, matrixProduct(R, R)).

fibm(N) -> M = [[0, 1], [1, 1]], [[_, F], [_, _]] = powerMatrix(M, N), F.

timing(F, N) ->
    S = erlang:timestamp(),
    F(N),
    C = erlang:timestamp(),
    timer:now_diff(C, S).
