defmodule WhatwasitDemo.User do
  use WhatwasitDemo.Web, :model
  use Coherence.Schema
  use Whatwasit

  schema "users" do
    field :name, :string
    field :email, :string
    coherence_schema

    timestamps
  end

  def changeset(model, params \\ %{}, opts \\ []) do
    model
    |> cast(params, [:name, :email] ++ coherence_fields)
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
    |> validate_coherence(params)
    |> prepare_version(opts)
  end
end
