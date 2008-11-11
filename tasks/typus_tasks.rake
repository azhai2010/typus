namespace :typus do

  desc "Install Typus plugins"
  task :plugins do

    plugins = [ "git://github.com/fesplugas/simplified_blog.git", 
                "git://github.com/fesplugas/simplified_activity_stream.git" ]

    system "script/plugin install #{plugins.join(' ')}"

  end

  desc "Install Typus dependencies (paperclip, acts_as_list, acts_as_tree)"
  task :dependencies do

    plugins = [ "git://github.com/thoughtbot/paperclip.git", 
                "git://github.com/rails/acts_as_list.git", 
                "git://github.com/rails/acts_as_tree.git" ]

    system "script/plugin install #{plugins.join(' ')}"

  end

  desc "List current roles"
  task :roles => :environment do
    Typus::Configuration.roles.each do |role|
      puts "=> Role `#{role.first}` has access to:"
      role.last.each { |key, value| puts "** #{key}: #{value}" }
    end
  end

end