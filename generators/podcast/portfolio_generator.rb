class PodcastGenerator < Rails::Generator::NamedBase

  def initialize(*runtime_args)
    # set first argument to the table's name so that the user doesn't have to pass it in.
    runtime_args[0] = ["podcasts"]
    super(*runtime_args)
  end

  def banner
    "Usage: script/generate podcast"
  end

  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate',
        :migration_file_name => "create_structure_for_podcast",
        :assigns => {
          :migration_name => "CreateStructureForPodcast"
        }
    end
  end

end if defined?(Rails::Generator::NamedBase)
