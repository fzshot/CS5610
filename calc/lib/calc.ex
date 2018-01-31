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
    input
    |> parse_number
  end

  def eval(input) do
    cond do
      length(input) == 1 ->
          hd(input)
      true ->
        [a,s|t] = input
        cond do
          is_number(a) ->
            cond do
              s == "+" ->
                a + eval(t)
              s == "-" ->
                [b|t] = t
                b = -1 * b
                a + eval([b] ++ t)
              s == "*" ->
                [b|t] = t
                cond do
                  b == "(" ->
                    [head, tail] = find_par(["("], [], [s] ++ t)
                    head = eval(tl(head))
                    eval([a * head] ++ tail)
                  true ->
                    eval([a * b] ++ t)
                end
              s == "/" ->
                [b|t] = t
                cond do
                  b == "(" ->
                    [head, tail] = find_par(["("], [], [s] ++ t)
                    head = eval(tl(head))
                    eval([a / head] ++ tail)
                  true ->
                    eval([a / b] ++ t)
                end
            end
          true ->
            [head, tail] = find_par(["("], [], [s] ++ t)
            head = eval(head)
            eval([head] ++ tail)
        end
    end
  end

  def parse_number(input) do
    input
    |> String.replace("(", " ( ")
    |> String.replace(")", " ) ")
    |> String.replace("+", " + ")
    |> String.replace("-", " - ")
    |> String.replace("*", " * ")
    |> String.replace("/", " / ")
    |> String.split
    |> Enum.map(fn(x) ->
      cond do
        (x == "+") or (x == "-") or (x == "*") or (x == "/") or (x == "(") or (x == ")")->
          x
        true ->
          elem(Float.parse(x), 0)
      end
    end)
    |> eval
  end

  def find_par(par, head, tail) do
    cond do
      Enum.empty?(par) ->
        [head, tail]
      true ->
        [h_tail|t_tail] = tail
        # IO.inspect(h_tail)
        cond do
          h_tail == "(" ->
            find_par(["("] ++ par, head, t_tail)
          h_tail == ")" ->
            find_par(tl(par), head, t_tail)
          true ->
            find_par(par, head ++ [h_tail], t_tail)
        end
    end
  end

end
