defmodule ElixirpayWeb.UsersController do
  use ElixirpayWeb, :controller

  alias Elixirpay.User

  def create(conn, params) do
    params
    |> Elixirpay.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  defp handle_response({:error, result}, conn) do
    conn
    |> put_status(:created)
    |> put_view(ElixirpayWeb.ErrorView)
    |> render("400.json", result: result)
  end

end
