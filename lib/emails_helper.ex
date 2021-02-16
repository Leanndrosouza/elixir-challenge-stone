defmodule EmailsHelper do

  def make_emails(0) do
    []
  end

  def make_emails(quantity) do
    ["user_email_#{quantity}@example.com" | make_emails(quantity - 1)]
  end

  def attach_distribution_to_emails([], []) do
    []
  end

  def attach_distribution_to_emails([emails_h | emails_t], [dist_h | dist_tail]) do
    [%{emails_h => dist_h} | attach_distribution_to_emails(emails_t, dist_tail)]
  end
end
