defmodule PartywaveWeb.UserHelper do
  def avatar(user, size) do
    PartywaveWeb.Avatar.url({user.avatar, user}, size)
  end
end
