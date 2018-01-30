defmodule Calc do
  @moduledoc """
  Documentation for Calc.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Calc.hello
      :world

  """

  def main() do
    IO.gets("Enter input: ")
    |> String.split(" ")
    |> eval([])
    main()
  end

  def eval(input, processing ) do
    cond do
      Enum.empty?(input) ->
        cond do
          length(processing) == 1->
            hd(processing)
            |> IO.puts()
          true ->
            [a,o,b|t] = processing
            cond do
              is_number(a) ->
                cond do
                  o == "+" ->
                    eval(input, [a+b] ++ t)
                  o == "-" ->
                    eval(input, [a-b] ++ t)
                end
              true ->
                IO.puts("Not implemented")
            end
        end
    end
  end

end
