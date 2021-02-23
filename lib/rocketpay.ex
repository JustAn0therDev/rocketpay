defmodule Rocketpay do
  alias Rocketpay.Users.Create
  defdelegate create_user(params), to: Create, as: :call

end
