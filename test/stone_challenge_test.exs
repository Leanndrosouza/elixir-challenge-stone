defmodule StoneChallengeTest do
  use ExUnit.Case
  doctest StoneChallenge
  import ItemsHelper
  import Calculator
  import EmailsHelper

  test "main function returns a list" do
    assert is_list(StoneChallenge.main())
  end

  test "calculate_items_sum is calculating correctly" do
    # Generates between 1 and 20 items
    items_list = make_items_list(Enum.random(1..20))

    items_list_total =
      Enum.map(items_list, fn x -> x.quantity * x.price end)
      |> Enum.reduce(fn x, acc -> x + acc end)

    assert items_list_total === calculate_items_sum(items_list)
  end

  test "calculate_items_sum works with empty list" do
    assert 0 === calculate_items_sum([])
  end

  test "distribution when the total is zero" do
    total = 0
    divisor = Enum.random(2..6)

    assert divide_total(total, divisor)
           |> Enum.all?(fn s -> s === 0 end)
  end

  test "distribution when the divisor is zero" do
    total = Enum.random(1..10000)
    divisor = 0
    assert divide_total(total, divisor) === []
  end

  test "sum of distribution is equal to the total of the items" do
    total = Enum.random(2..10000)
    divisor = Enum.random(1..1000)

    assert divide_total(total, divisor) |> Enum.reduce(fn x, acc -> x + acc end) === total
  end

  test "distribution egalitarian when remainder is zero" do
    # For total equal 300, remainder is equal zero for divisions between 2 and 6
    total = 300
    divisor = Enum.random(2..6)
    quotient = div(total, divisor)

    assert divide_total(total, divisor)
           |> Enum.all?(fn s -> s === quotient end)
  end

  test "distribution when total is smaller than the divisor" do
    total = Enum.random(1..1000)
    divisor = Enum.random(2000..10000)
    remainder = rem(total, divisor)
    distribution_list = divide_total(total, divisor)
    # Ensure that the remainder has been distributed among all
    assert Enum.reduce(distribution_list, fn x, acc -> x + acc end) === remainder
    # Ensure the better equal distribution
    assert Enum.min(distribution_list) === 0 and Enum.max(distribution_list) === 1
  end

  test "distribution when remainder is non-zero" do
    # 997 is a prime number
    total = 997
    divisor = Enum.random(2..996)
    quotient = div(total, divisor)

    distribution_list = divide_total(total, divisor)

    assert Enum.min(distribution_list) === quotient
    # Ensure the better equal distribution
    assert Enum.max(distribution_list) === quotient + 1
  end

  test "verify result format and the integration of functions" do
    emails = make_emails(Enum.random(1..20))

    distribution_list =
      make_items_list(Enum.random(1..20000))
      |> calculate_items_sum
      |> divide_total(length(emails))

    result = attach_distribution_to_emails(emails, distribution_list)
    assert length(result) === length(emails)
    # verify if all entries contains a email
    assert Enum.all?(result, fn s ->
             Map.keys(s)
             |> Enum.all?(fn email -> String.contains?(email, "@") end)
           end)
  end
end
