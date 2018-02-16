defmodule TasktrackerWeb.SessionController do
  use TasktrackerWeb, :controller

  alias Tasktracker.Accounts
  # alias Tasktracker.Accounts.User

  def create(conn, %{"email" => email}) do
    IO.inspect(email)
    user = Accounts.get_user_by_email(email)
    IO.inspect(user)
    if user do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Welcome back #{user.name}")
      |> redirect(to: page_path(conn, :index))
    else
      conn
      |> put_flash(:error, "No user #{email} found!")
      |> redirect(to: page_path(conn, :index))
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "Logged out")
    |> redirect(to: page_path(conn, :index))
  end
end
