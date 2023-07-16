defmodule TmdbCloneWeb.UserController do
  use TmdbCloneWeb, :controller
  require Logger
  alias TmdbClone.Accounts
  alias TmdbCloneWeb.Auth.Guardian

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_account(user_params) do
      {:ok, user} ->
        case TmdbCloneWeb.Auth.Guardian.create_token(user) do
          {:ok, _account, token} ->
            conn
            |> Guardian.Plug.sign_in(token)
            |> put_flash(:info, "Account created successfully and user signed in.")
            |> redirect(to: "/")

          _ ->
            Logger.error("Failed to create token.")

            conn
            |> redirect(to: "/")
        end

      {:error, changeset} ->
        Logger.error("Failed to create account: #{inspect(changeset.errors)}")

        conn
        |> redirect(to: "/")
    end
  end

  def delete(conn, %{"user" => user_params}) do
    case Accounts.delete_account(user_params) do
      {:ok, _user} ->
        Logger.info("User deleted successfully.")

        conn
        |> redirect(to: "/")

      {:error, _changeset} ->
        Logger.error("Failed to delete user.")

        conn
        |> redirect(to: "/")
    end
  end

  def sign_in(conn, %{"user" => user_params}) do
    case Guardian.authenticate(user_params["email"], user_params["password"]) do
      {:ok, account, _token} ->
        conn
        |> Guardian.Plug.sign_in(account)
        |> put_flash(:info, "Signed in successfully.")
        |> redirect(to: "/")

      {:error, reason} ->
        Logger.error("Failed to sign in: #{reason}")

        conn
        |> redirect(to: "/login")
    end
  end
end
