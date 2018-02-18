defmodule PartywaveWeb.ReviewView do
  use PartywaveWeb, :view
  import Scrivener.HTML

  def avatar(user) do
    PartywaveWeb.Avatar.url({user.avatar, user}, :thumb)
  end
end
