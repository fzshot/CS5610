defmodule CalcTest do
  use ExUnit.Case
  doctest Calc

  test "Calc test" do
    assert Calc.main("2 + 3") == 5
    assert Calc.main("5 * 1") == 5
    assert Calc.main("20 / 4") == 5
    assert Calc.main("5 - 1 + 3 - 2") == 5
    assert Calc.main("5 - 1 * 3 - 2") == 0
    assert Calc.main("1 + 2 * 3 - 5 / 5 + 6 * 7") == 48
    # assert Calc.main("24 / 6 + (5 - 4)") == 5
  end
end
