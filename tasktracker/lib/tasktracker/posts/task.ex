defmodule Tasktracker.Posts.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Posts.Task


  schema "tasks" do
    field :body, :string
    field :complete, :boolean, default: false
    field :time, :integer
    field :title, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :body, :time, :complete])
    |> validate_required([:title, :body, :time, :complete])
  end
end
