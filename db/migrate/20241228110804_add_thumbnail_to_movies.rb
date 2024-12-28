class AddThumbnailToMovies < ActiveRecord::Migration[7.2]
  def change
    add_column :movies, :thumbnail, :string
  end
end
