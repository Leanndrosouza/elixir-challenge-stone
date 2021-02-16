defmodule ItemsHelper do
  def make_items_list(0) do
    []
  end

  def make_items_list(length) do
    [make_item(Enum.random(1..10), Enum.random(1..3000)) | make_items_list(length - 1)]
  end

  def make_item(quantity, price) do
    %{quantity: quantity, price: price}
  end
end
