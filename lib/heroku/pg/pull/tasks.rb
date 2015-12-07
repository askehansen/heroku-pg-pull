require 'rake'

namespace 'heroku:pg' do

  desc 'Pull a postgres backup from heroku and replace the current database (should probably not be used in production)'
  task pull: :environment do
    Bundler.with_clean_env do
      db_name = Rails.configuration.database_configuration[Rails.env]['database']

      STDOUT.puts "Replace #{db_name}? [y/n]"
      input = STDIN.gets.chomp
      abort "Aborting task" unless input == 'y'

      backup_url = `heroku pg:backups public-url`
      backup_url.strip!
      sh "curl -o latest.dump '#{backup_url}'"
      sh "pg_restore --verbose --clean --no-acl --no-owner -h localhost -d #{db_name} latest.dump"
      sh 'rm latest.dump'
    end
  end

end
