defmodule Calc do
  @moduledoc """
  Documentation for Calc.
  """

  # @doc """
  # Hello world.

  # ## Examples

  #     iex> Calc.hello
  #     :world

  # """

  def main(input) do
    # IO.gets("Enter input: ")
    # |> String.split()
    # |> eval([], [])
    # main()
    String.split(input)
    |> eval([], [])
  end

  def eval(input, f, numbers) do
    cond do
      Enum.empty?(input) ->
        cond do
          length(numbers) == 1 ->
            hd(numbers)
          true ->
            [sign|tF] = f
            [a,b|tNumber] = numbers
            cond do
              sign == "+" ->
                eval(input, tF, [a+b] ++ tNumber)
              sign == "-" ->
                eval(input, tF, [a-b] ++ tNumber)
              sign == "*" ->
                eval(input, tF, [a-b] ++ tNumber)
              sign == "/" ->
                eval(input, tF, [a/b] ++ tNumber)
              true ->
                "test"
            end
        end
      true ->
        [h|t] = input
        cond do
          (h == "+") or (h == "-") ->
            eval(t, f ++ [h], numbers)
          (h == "*") or (h == "/") ->
            eval(t, [h] ++ f, numbers)
          true ->
            h = String.to_integer(h)
            eval(t, f, numbers ++ [h])
        end
    end
  end

  # def findP(f, pList, newF) do
  #   cond do
  #     Enum.empty?(pList) ->
        
  #   end
  # end

end
