%%%-------------------------------------------------------------------
%%% @author igorsilva
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Feb 2020 5:03 PM
%%%-------------------------------------------------------------------
-module(try_test).
-author("igorsilva").

%% API
-export([demo/0, demo_catch/0, demo_trace/0]).


generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT', a};
generate_exception(5) -> error(a).

catcher(N) ->
  try generate_exception(N) of
    Val -> {N, normal, Val}
  catch
    throw:X -> {N, caught, thrown, X};
    exit:X -> {N, caught, exited, X};
    error:X -> {N, caught, error, X}
  end.

demo() ->
  [catcher(I) || I <- [1, 2, 3, 4, 5]].

demo_catch() ->
  [{I, (catch generate_exception(I))} || I <- [1, 2, 3, 4, 5]].

demo_trace() ->
  try generate_exception(5)
  catch
    error:X ->
      {X, erlang:get_stacktrace()}
  end.