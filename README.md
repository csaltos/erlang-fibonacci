# Erlang Fibonacci

Implementation of Fibonacci with Erlang including an optimization based on matrices

## Requirements

* Erlang 19+

## Introduction

Fibonacci is refered to a sequence in mathematics that starts with 0 and 1 increasing with the sum of the previous two elements, produccion a series like:

0, 1, 1, 2, 3, 5, 8, 13, ...

This code tries to implement this series using Erlang from a basic and slow solution to an intermediate better solution and a complete optimized solution using matrices.

> The Erlang standard library can be used for most of this code but the code is kept more explicit to help understand better the internal and power of the language constructs.

## Basic Fibonacci

This first implementation is coded at the function `fib/1` at the file `fibonacci.erl` at this basic level the elements of the series are calculated sequentially.

To run the code, execute the Erlang shell with the command `erl` and inside these commands:

```
c(fibonacci).
fibonacci:fib(10).
fibonacci:fib(20).
```

You should get the results of compiling the code with the first line and then getting the fibonacci of `10` which is `55` and the fibonacci for `20` that is `6765`.

With this small values the lack of optimization of the code is not evident, but try to get the fibonacci for `1000` with the call `fibonacci:fib(1000).` and you will hit a wall quickly.

> If takes too long or if hangs, just press `Ctrl-C` twice to try again.

## Tail call Fibonacci

As an intermediate optimization an arguments based calculation is also included at the function `fibo/1` that you can call with the Erlang shell `erl` and then inside the commands:

```
c(fibonacci).
fibonacci:fibo(10).
fibonacci:fibo(20).
fibonacci:fibo(1000).
```

You will notice the same results for the fibonacci values for `10` and `20` but now you should be able to calculate fibonacci of `1000` which is `43466557686937456435688527675040625802564660517371780402481729089536555417949051890403879840079255169295922593080322634775209689623239873322471161642996440906533187938298969649928516003704476137795166849228875` (yes a very long name, and is just the 1000th on the fibonacci series).

The computers are very fast and it's difficul to notice the timing difference, but if you try to get the fibonacci or even large numbers you will perciebe a noticeable delay, for example try to calculate the fibonacci for one millon with this call:

```
fibonacci:fibo(1000000).
```

After a delay should print a very long number !!

## Matrices Fibonacci

We can optimize fibonacci series even further using matrices, for that, you can run this commands again inside the Erlang shell `erl`:

```
c(fibonacci).
fibonacci:fibm(10).
fibonacci:fibm(20).
fibonacci:fibm(1000).
fibonacci:fibm(1000000).
```

The calculated values are the same but now it's faster, that's the power of mathematics !!

## Timing

Since the difference in timings are very narrow, you may run this functions with the help of the internal computer clock to have more information about it with calls like:

```
fibonacci:timing(fun(X) -> fibonacci:fibo(X) end, 10000).
fibonacci:timing(fun(X) -> fibonacci:fibm(X) end, 10000).
```

When calling this functions the output is the time in milliseconds the function takes.

## Thank you

This code and all this mathematica power is possible thanks to the brillant Eddy Ramirez from Costa Rica.

For the mathematic background and more information about coding using Erlang, please refer to the videos at https://www.youtube.com/watch?v=cs3TOyAQJXQ&list=PLZ26hi4ZVN-DHGIb8JacmadXFkVEQvpvb

> The videos are in Spanish (the second most spoken language in the world, yes, more than Erlang, aunque usted no lo crea)
