class <%= migration_name %> < ActiveRecord::Migration

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

    User.find(:all).each do |user|
      user.plugins.create(:name => "Podcast",
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end

  def self.down
    UserPlugin.destroy_all({:name => "Podcast"})

    drop_table :podcasts
  end

end
