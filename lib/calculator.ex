defmodule Calculator do
  def calculate_items_sum([]) do
    0
  end

  def calculate_items_sum([head | tail]) do
    head.quantity * head.price + calculate_items_sum(tail)
  end

  def divide_total(_, 0) do
    []
  end

  def divide_total(total, quantity) do
    remainder = rem(total, quantity)
    if remainder === 0 do
      make_distribution_list(div(total, quantity), quantity)
    else
      make_distribution_list(div(total, quantity), quantity)
      |> share_remainder(remainder)
    end
  end

  def share_remainder(list, 0) do
    list
  end

  def share_remainder([head | tail], remainder) do
    share_remainder(tail ++ [head + 1], remainder - 1)
  end

  def make_distribution_list(_, 0) do
    []
  end

  def make_distribution_list(value, quantity) do
    [value | make_distribution_list(value, quantity - 1)]
  end
end
