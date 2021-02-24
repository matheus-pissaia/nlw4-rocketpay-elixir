# Serviço de criação e salvamento de um usuário no banco de dados
defmodule Rocketpay.Users.Create do
  alias Rocketpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
