-module(shop).
-export([cost/1, total/1, test/0]).
-import(lib_misc, [map/2, sum/1]).

cost(oranges) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

total(L) -> sum([cost(Item) * N || {Item, N} <- L]).

test() ->
  0 = total([]),
  10 = total([{newspaper, 1}, {apples, 1}]),
  81 = total([{pears, 9}]),
  tests_passed.