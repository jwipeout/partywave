defmodule PartywaveWeb.SurfboardImage do
  use Arc.Definition

  # Include ecto support (requires package arc_ecto installed):
  use Arc.Ecto.Definition

  # public to view
  @acl :public_read

  @versions [:original, :medium]

  # To add a thumbnail version:
  # @versions [:original, :thumb]

  # Whitelist file extensions:
  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  # Define a thumbnail transformation:
  def transform(:medium, _) do
    {:convert, "-strip -thumbnail 200x238^ -gravity center -extent 200x238 -format png", :png}
  end

  # Override the persisted filenames:
  # def filename(version, _) do
  #   version
  # end

  # Override the storage directory:
  # def storage_dir(version, {file, scope}) do
  #   "uploads/user/avatars/#{scope.id}"
  # end

  # Provide a default URL if there hasn't been a file uploaded
  # def default_url(version, scope) do
  #   "/images/avatars/default_#{version}.png"
  # end

  # Specify custom headers for s3 objects
  # Available options are [:cache_control, :content_disposition,
  #    :content_encoding, :content_length, :content_type,
  #    :expect, :expires, :storage_class, :website_redirect_location]
  #
  # def s3_object_headers(version, {file, scope}) do
  #   [content_type: Plug.MIME.path(file.file_name)]
  # end
end
