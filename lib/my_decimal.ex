defmodule ErlangBug.MyDecimal do
  defdelegate new(d), to: Decimal

  def neq(d1, d2) do
    case Decimal.cmp(d1, d2) do
      :eq -> false
      _ -> true
    end
  end
end
