class AddSlugToRefineryPodcasts < ActiveRecord::Migration

  def change
    add_column :refinery_podcasts, :slug, :string
    add_index :refinery_podcasts, :slug
  end

end
