defmodule KattyWeb.UserSessionController do
  use KattyWeb, :controller

  alias Katty.Users
  alias KattyWeb.UserAuth
  plug :validate_captcha, [] when action == :create

  def new(conn, _params) do
    render(conn, "new.html", error_message: nil)
  end

  def validate_captcha(conn, params ) do
    case Recaptcha.verify(conn.params["g-recaptcha-response"]) do
      {:ok, response} -> conn
      {:error, [:invalid_input_response]} ->
        conn
        |> put_flash(:error, "Error: Wrong Captcha")
        |> redirect(to: "/log_in")
        |> halt()
          end
  end


  def create(conn, %{"user" => user_params}) do
    %{"email" => email, "password" => password} = user_params

    if user = Users.get_user_by_email_and_password(email, password) do
      UserAuth.log_in_user(conn, user, user_params)
    else
      # In order to prevent user enumeration attacks, don't disclose whether the email is registered.
      render(conn, "new.html", error_message: "Meowwwwww!! Invalid email or password")
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UserAuth.log_out_user()
  end
end
