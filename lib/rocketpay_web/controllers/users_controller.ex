defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User

  action_fallback RocketpayWeb.FallbackController

  # Antes:

  # def create(conn, params) do
  #   params
  #   |> Rocketpay.create_user()
  #   |> handle_response(conn)
  # end

  # defp handle_response({:ok, %User{} = user}, conn) do
  #   conn
  #   |> put_status(:created)
  #   |> render("create.json", user: user)
  # end

  # Depois:

  def create(conn, params) do
    # Com o 'with' podemos fazer 'condicionais' (utilização do 'Pattern Matching')
    # Se a condição dá 'match', então o bloco 'do' é executado.
    # Se não der 'match', então é retornado um erro para quem chamou essa função.
    # Assim não precisamos criar várias vezes funções que lidam com erros.
    # Obs: podem ser colocadas múltiplas senteças / condições dentro do 'with'.
    with {:ok, %User{} = user} <- Rocketpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
