defmodule StoneChallenge do
  import ItemsHelper
  import Calculator
  import EmailsHelper

  def main() do
    emails = make_emails(Enum.random(1..20))
    items = make_items_list(Enum.random(1..20000))
    total = calculate_items_sum(items)
    distribution_list = divide_total(total, length(emails))

    attach_distribution_to_emails(emails, distribution_list)
  end
end
