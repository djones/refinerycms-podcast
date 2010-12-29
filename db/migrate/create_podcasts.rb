class CreatePodcasts < ActiveRecord::Migration

  def self.up
    create_table :podcasts do |t|
      t.string :title
      t.string :author
      t.string :subtitle
      t.integer :file_id
      t.date :published
      t.string :duration
      t.string :keywords
      t.text :summary
      t.integer :position

      t.timestamps
    end

    add_index :podcasts, :id

    load(Rails.root.join('db', 'seeds', 'podcasts.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "podcasts"})

    Page.delete_all({:link_url => "/podcasts"})

    drop_table :podcasts
  end

end
