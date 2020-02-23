%%%-------------------------------------------------------------------
%%% @author igorsilva
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. Feb 2020 9:03 PM
%%%-------------------------------------------------------------------
-module(lib_misc).
-author("igorsilva").

%% API
-export([for/3, sum/1, map/2, qsort/1, pythag/1, perms/1, odds_and_evens/1,
  my_tuple_to_list/1, my_time_func/1, my_date_string/0]).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I) | for(I + 1, Max, F)].

sum([H | T]) -> H + sum(T);
sum([]) -> 0.

map(F, [H | T]) -> [F(H) | map(F, T)];
map(_, []) -> [].

qsort([]) -> [];
qsort([Pivot | T]) ->
  qsort([X || X <- T, X < Pivot])
  ++ [Pivot] ++
    qsort([X || X <- T, X >= Pivot]).

pythag(N) ->
  [{A, B, C} ||
    A <- lists:seq(1, N),
    B <- lists:seq(1, N),
    C <- lists:seq(1, N),
    A + B + C =< N,
    A * A + B * B =:= C * C
  ].

perms([]) -> [[]];
perms(L) -> [[H | T] || H <- L, T <- perms(L-- [H])].

odds_and_evens(L) ->
  odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H | T], Odds, Evens) ->
  case (H rem 2) of
    1 -> odds_and_evens_acc(T, [H, Odds], Evens);
    0 -> odds_and_evens_acc(T, Odds, [H | Evens])
  end;
odds_and_evens_acc([], Odds, Evens) ->
  {lists:reverse(Odds), lists:reverse(Evens)}.

my_tuple_to_list(T) ->
  my_tuple_to_list(T, tuple_size(T), []).

my_tuple_to_list(_T, 0, Acc) -> Acc;
my_tuple_to_list(T, N, Acc) ->
  my_tuple_to_list(T, N-1, [element(N, T) | Acc]).

my_time_func(F) ->
  TimeBefore = erlang:system_time(nanosecond),
  Result = F(),
  TimeAfter = erlang:system_time(nanosecond),
  io:format("~w nanoseconds~n", [TimeAfter-TimeBefore]),
  Result.

my_date_string() ->
  { Year, Month, Day} = date(),
  { Hour, Minute, Second} = time(),
  io:format("~w/~w/~w at ~w:~w:~w~n", [Month, Day, Year, Hour, Minute, Second]).