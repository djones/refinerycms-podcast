class CreateRefineryPodcasts < ActiveRecord::Migration

  def up
    create_table :refinery_podcasts do |t|
      t.string :title
      t.string :author
      t.string :subtitle
      t.integer :file_id
      t.date :published_at
      t.string :duration
      t.string :keywords
      t.text :summary
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-podcasts"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/podcasts/podcasts"})
    end

    drop_table :refinery_podcasts

  end

end
