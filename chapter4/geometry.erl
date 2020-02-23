-module(geometry).
-export([test/0, area/1]).

test() ->
  12 = area({rectangle, 3, 4}),
  144 = area({square, 12}),
  12.56636 = area({circle, 2}),
  tests_passed.


area({square, Side}) -> Side * Side;
area({rectangle, Width, Height}) -> Width * Height;
area({triangle, Base, Height}) -> 0.5 * Base * Height;
area({equilateral_triangle, Side}) -> (math:sqrt(3) / 4) * Side * Side;
area({right_angle_triangle, A, B}) -> (A * B) / 2;
area({circle, Radius}) -> 3.14159 * Radius * Radius.
