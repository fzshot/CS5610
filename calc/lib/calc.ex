defmodule Calc do
  @moduledoc """
  Provides a function `main/0` to get user input of
  arithmetic expression, and prints the calculation result.
  Provides a function `eval/1` to evaluate a arithmetic expression
  and return a number.
  """

  @doc """
  Prompt arithmetic expression input and prints result
  """
  def main() do
    IO.gets("Enter input: ")
    |> eval
    |> IO.puts
    main()
  end

  @doc """
  Evaluate an arithmetic expression and return a number

  ## Parameters
    - input: String that representes an arithmetic expression
  """
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
            cond do
              length(stack) < 2 ->
                raise ArgumentError, message: "Invalid Input"
              true ->
                [b,a|t_stack] = stack
                cond do
                  is_number(a) and is_number(b) ->
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
                  true ->
                    raise ArgumentError, message: "Invalid Input"
                end
            end
        end
    end
  end

  defp parse_number(input) do
    input
    |> String.replace("(", " ( ")
    |> String.replace(")", " ) ")
    |> String.split
    |> Enum.map(fn(x) ->
      cond do
        (x == "+") or (x == "-") or (x == "*") or (x == "/") or (x == "(") or (x == ")")->
          x
        true ->
          {number, rest} = Float.parse(x)
          cond do
            String.length(rest) == 0 ->
              number
            true ->
              raise ArgumentError, message: "Invalid Input"
          end
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
            to_postfix(t, [h] ++ stack, result)
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
