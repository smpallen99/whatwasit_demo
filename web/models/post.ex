defmodule WhatwasitDemo.Post do
  use WhatwasitDemo.Web, :model
  use Whatwasit

  schema "posts" do
    field :title, :string
    field :body, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}, opts \\ []) do
    struct
    |> cast(params, [:title, :body])
    |> validate_required([:title, :body])
    |> prepare_version(opts)
  end
end
