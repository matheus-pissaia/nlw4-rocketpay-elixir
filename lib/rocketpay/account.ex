# Nesse arquivo iremos criar nosso 'schema' para realizar o mapeamento de dados que serão
# inseridos no nosso banco de dados
# Obs: para uma linguagem orientada a objetos o 'model' é a analogia mais próxima com 'schema'

defmodule Rocketpay.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rocketpay.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, User

    timestamps()
  end

  # 'Changeset' basicamente possui como função principal mapear dados e validar dados.
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> check_constraint(:balance, :balance_must_be_positive_or_zero)
  end
end
