defmodule KattyWeb.UserLive.Index do
  use KattyWeb, :live_view
  alias Katty.Users

  def mount(params, session, socket) do
    {:ok, assign(socket, :users, Users.list_users())}
  end
end
