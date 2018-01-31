defmodule CalcTest do
  use ExUnit.Case
  doctest Calc

  test "Calc 1" do
    assert Calc.main("2 + 3") == 5
    assert Calc.main("5 * 1") == 5
    assert Calc.main("20 / 4") == 5
    assert Calc.main("5 - 1 + 3 - 2") == 5
    assert Calc.main("5 - 1 * 3 - 2") == 0
    assert Calc.main("1 + 2 * 3 - 5 / 5 + 6 * 7") == 48
    assert Calc.main("3 + 4 + 7 * 2 - 1 - 9") == 11
    assert Calc.main("12 * 7 + 4 - 7 / 3 * 9") == 67
    assert_in_delta Calc.main("5 / 4 + 13 / 3 - 7 * 6"), -36.417, 0.001
    # assert Calc.main("24 / 6 + (5 - 4)") == 5
  end

end
