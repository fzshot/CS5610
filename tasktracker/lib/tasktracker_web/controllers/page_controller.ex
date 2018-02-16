defmodule TasktrackerWeb.PageController do
  use TasktrackerWeb, :controller

  def index(conn, _params) do
    # changeset = Tasktracker.Posts.change_task(%Tasktracker.Posts.Task{})
    render conn, "index.html"
  end
end
