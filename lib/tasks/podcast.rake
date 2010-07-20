namespace :refinery do
  namespace :podcast do
	  desc "Install extra files from the podcast plugin"

  	task :install do
  		[%w(db migrate), %w(app views podcasts)].each do |dir|
        Rails.root.join(dir.join(File::SEPARATOR)).mkpath
      end

      podcast_root = Pathname.new(File.expand_path("../../../", __FILE__))
      copies = [
        {:from => %w(app views podcasts), :to => %w(app views podcasts), :filename => "index.rss.builder"},
      ]
      puts "\nCopying files...\n\n"
    	copies.each do |copy|
        copy_from = podcast_root.join(copy[:from].join(File::SEPARATOR), copy[:filename])
    	  copy_to = Rails.root.join(copy[:to].join(File::SEPARATOR), copy[:filename])
        unless copy_to.exist? and ENV["force"].presence.to_s != "true"
    	    FileUtils::cp copy_from.to_s, copy_to.to_s
    	    puts "Copied to #{copy_to}"
        else
          puts "'#{File.join copy[:to], copy[:filename]}' already existed in your application so your existing file was not overwritten - use force=true to overwrite."
          puts "Without this file being up to date, the podcast may not function properly."
        end
      end

    	puts "\nCopied all files."
    	puts "\nGenerating migration..."
    	puts `ruby #{Rails.root.join('script', 'generate').cleanpath.to_s.gsub(/\/$/, '')} podcast`
    	puts "\nNow, run these tasks:"
    	puts "  rake db:migrate"
    	puts "\nWe hope you enjoy using our podcast plugin!\n\n"
  	end
	end
end