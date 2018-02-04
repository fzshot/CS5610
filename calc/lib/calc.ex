defmodule Calc do
  @moduledoc """
  Documentation for Calc.
  """

  def main(input) do
    # IO.gets("Enter input: ")
    # |> String.split()
    # |> eval([], [])
    # main()
    input
    |> parse_number
  end

  def eval(input, stack) do
    cond do
      Enum.empty?(input) ->
        hd(stack)
      true ->
        [h|t] = input
        cond do
          is_number(h) ->
            eval(t, [h] ++ stack)
          true ->
            [b,a|t_stack] = stack
            case h do
              "+" ->
                eval(t, [a+b] ++ t_stack)
              "-" ->
                eval(t, [a-b] ++ t_stack)
              "*" ->
                eval(t, [a*b] ++ t_stack)
              "/" ->
                eval(t, [a/b] ++ t_stack)
            end
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
    |> to_postfix([], [])
  end

  def to_postfix(input, stack, result) do
    cond do
      Enum.empty?(input) ->
        result ++ stack
        |> eval([])
      true ->
        [h|t] = input
        cond do
          is_number(h) ->
            to_postfix(t, stack, result ++ [h])
          Enum.empty?(stack) ->
            cond do
              is_number(h) ->
                to_postfix(t, stack, result ++ [h])
              true ->
                to_postfix(t, [h] ++ stack, result)
            end
          true ->
            cond do
               (h == "+") or (h == "-") ->
                cond do
                  Enum.empty?(stack) ->
                    to_postfix(t, [h] ++ stack, result)
                  true ->
                    [h_stack|t_stack] = stack
                    cond do
                      h_stack == "(" ->
                        to_postfix(t, [h] ++ stack, result)
                      true ->
                        cond do
                          Enum.empty?(t_stack) ->
                            to_postfix(t, [h] ++ t_stack, result ++ [h_stack])
                          true ->
                            to_postfix(input, t_stack, result ++ [h_stack])
                        end
                    end
                end
              (h == "*") or (h == "/") ->
                cond do
                  Enum.empty?(stack) ->
                    to_postfix(t, [h] ++ stack, result)
                  true ->
                    [h_stack|t_stack] = stack
                    cond do
                      (h_stack == "*") or (h_stack == "/") ->
                        cond do
                          Enum.empty?(t_stack) ->
                            to_postfix(t, [h] ++ t_stack, result ++ [h_stack])
                          true ->
                            to_postfix(input, t_stack, result ++ [h_stack])
                        end
                      true ->
                        to_postfix(t, [h] ++ stack, result)
                    end
                end
              h == "(" ->
                to_postfix(t, [h] ++ stack, result)
              h == ")" ->
                [h_stack|t_stack] = stack
                cond do
                  h_stack == "(" ->
                    to_postfix(t, t_stack, result)
                  true ->
                    to_postfix(input, t_stack, result ++ [h_stack])
                end
              true ->
                to_postfix(t, stack, result ++ [h])
            end
        end
    end
  end

end
