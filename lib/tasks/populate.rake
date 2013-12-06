namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Invoke rake db:migrate just in case...
    Rake::Task['db:migrate'].invoke

    print "Step  0: Clearing old data"
    [AccountType].each(&:delete_all)
    puts "...done!"

    #Add an account type
  
    print "Step  1: Adding Account Types"
    type = AccountType.new
    type.name = "Google"
    type.permissions = ["Delete", "Archive", "Transfer Ownership"]
    type.content = "Here is some content"
    type.save!
    

    puts ".... done!"

  end
end
