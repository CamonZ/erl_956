defmodule ErlangBug do
  @decimal ErlangBug.MyDecimal

  # thing is a map where:
  # baz and quux are floats
  # foo is a timestamp
  # bar is a boolean
  def thing_status(thing) do
    baz = Decimal.new("#{thing["baz"]}")
    quux = Decimal.new("#{thing["quux"]}")

    is_foo? = not is_nil(thing["foo"])
    is_bar? = thing["bar"]

    is_baz? = @decimal.neq(baz, "0")
    is_quux? = @decimal.neq(quux, baz)

    cond do
      is_foo? and is_bar? ->
        "foobar"

      is_foo? and not is_baz? ->
        "foounbaz"

      not is_foo? and is_quux? ->
        "unfooquux"

      not is_foo? and not is_quux? ->
        "unfoounquux"
    end
  end
end
