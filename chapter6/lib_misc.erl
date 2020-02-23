%%%-------------------------------------------------------------------
%%% @author igorsilva
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Feb 2020 5:12 PM
%%%-------------------------------------------------------------------
-module(lib_misc).
-author("igorsilva").

%% API
-export([sqrt/1]).

sqrt(X) when X < 0 ->
  error({squareRootNegativeArgument, X});
sqrt(X) ->
  math:sqrt(X).