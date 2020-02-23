%%%-------------------------------------------------------------------
%%% @author igorsilva
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Feb 2020 11:05 AM
%%%-------------------------------------------------------------------
-module(math_functions).
-author("igorsilva").

%% API
-export([even/1, odd/1, filter/2, split_acc/1, split_filter/1]).

even(N) -> N rem 2 =:= 0.

odd(N) -> abs(N rem 2) =:= 1.

filter(F, L) -> [X || X <- L, F(X)].

split_acc(L) ->
  split_acc(L, {[], []}).

split_acc([], {Odds, Evens}) ->
  {lists:reverse(Odds), lists:reverse(Evens)};
split_acc([H | T], {Odds, Evens}) ->
  case abs(H rem 2) of
    0 -> split_acc(T, {Odds, [H | Evens]});
    1 -> split_acc(T, {[H | Odds], Evens})
  end.

split_filter(L) ->
  {
    filter(fun(N) -> odd(N) end, L),
    filter(fun(N) -> even(N) end, L)
  }.