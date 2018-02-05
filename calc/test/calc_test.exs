defmodule CalcTest do
  use ExUnit.Case

  test "without parenthesis" do
    assert Calc.eval("2 + 3") == 5
    assert Calc.eval("5 * 1") == 5
    assert Calc.eval("20 / 4") == 5
    assert Calc.eval("5 - 1 + 3 - 2") == 5
    assert Calc.eval("5 - 1 * 3 - 2") == 0
    assert Calc.eval("1 + 2 * 3 - 5 / 5 + 6 * 7") == 48
    assert Calc.eval("3 + 4 + 7 * 2 - 1 - 9") == 11
    assert Calc.eval("12 * 7 + 4 - 7 / 3 * 9") == 67
    assert Calc.eval("1 + 3 * 3 + 1") == 11
    assert_in_delta Calc.eval("5 / 4 + 13 / 3 - 7 * 6"), -36.417, 0.001
  end

  test "with parenthesis" do
    assert_in_delta Calc.eval("5 / 10 + (11 - 7) * 7"), 28.5, 0.1
    assert_in_delta Calc.eval("7 - 5 / (8 + 11) * 9 + 7"), 11.63, 0.01
    assert_in_delta Calc.eval("7 - 14 * 14 - 10 / (15 + 8)"), -189.43, 0.01
    assert Calc.eval("24 / 6 + (5 - 4)") == 5
    assert Calc.eval("15 + 14 * (6 - 6) * 8 * 11") == 15
    assert Calc.eval("(1 + 2) * 3 - 4 / 2") == 7
    assert Calc.eval("((1 + 2) * 3 - 4) / 2") == 2.5
    assert Calc.eval("((1 + 2) * 3 - 4) / 2 + ((1 + 2) * 3 - 4) / 2") == 5
    assert Calc.eval("((1 + 2) * 3 - 4) / 2 + (1 + 2) * 3 - 4 / 2") == 9.5
  end

  test "float number" do
    assert_in_delta Calc.eval("((1.25 + 45.67) * 2.75 - 4.25) / 2"), 62.39, 0.01
  end

  test "more tests" do
    assert_in_delta Calc.eval("7-5/((8+11)*9)+7"), 13.97, 0.01
    assert_in_delta Calc.eval("7-(5/((8 + 11)*9)+7)"), -0.0292, 0.0001
    assert_in_delta Calc.eval("(7-5/((8+11)*9))+7"), 13.97, 0.01
    assert_in_delta Calc.eval("7-14*(14-10/(15+8))"), -182.91, 0.01
  end


end
