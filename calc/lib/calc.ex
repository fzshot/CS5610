defmodule Calc do
  @moduledoc """
  Documentation for Calc.
  """

  def main() do
    IO.gets("Enter input: ")
    |> eval
    |> IO.puts
    main()
  end

  def eval(input) do
    input
    |> parse_number
  end

  defp calculation(input, stack) do
    cond do
      Enum.empty?(input) ->
        hd(stack)
      true ->
        [h|t] = input
        cond do
          is_number(h) ->
            calculation(t, [h] ++ stack)
          true ->
            [b,a|t_stack] = stack
            case h do
              "+" ->
                calculation(t, [a+b] ++ t_stack)
              "-" ->
                calculation(t, [a-b] ++ t_stack)
              "*" ->
                calculation(t, [a*b] ++ t_stack)
              "/" ->
                cond do
                  b == 0 ->
                    raise ArithmeticError, message: "Divide by zero"
                  true ->
                    calculation(t, [a/b] ++ t_stack)
                end
            end
        end
    end
  end

  defp parse_number(input) do
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
    |> (fn(x) ->
      valid_par(x, x, [])
      end).()
    |> to_postfix([], [])
  end

  defp valid_par(input, process, stack) do
    cond do
      Enum.empty?(process) ->
        cond do
          Enum.empty?(stack) ->
            input
          true ->
            raise ArgumentError, message: "Parenthesis Error"
        end
      true ->
        [h|t] = process
        case h do
          "(" ->
            valid_par(input, t, [h]++stack)
          ")" ->
            cond do
              Enum.empty?(stack) ->
                raise ArgumentError, message: "Parenthesis Error"
              true ->
                [h_stack|t_stack] = stack
                case h_stack do
                  "(" ->
                    valid_par(input, t, t_stack)
                  _ ->
                    raise ArgumentError, message: "Parenthesis Error"
                end
            end
          _ ->
            valid_par(input, t, stack)
        end
    end
  end

  defp to_postfix(input, stack, result) do
    cond do
      Enum.empty?(input) ->
        result ++ stack
        |> calculation([])
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
