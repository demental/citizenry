namespace :user do
  namespace :admin do
    desc 'Grants admin privileges to specified user email or login'
    task :grant, [:email] => :environment do |t,args|
      find_user(args.email).grant!
    end
    desc 'Grants admin privileges to specified user email or login'
    task :ungrant, [:email] => :environment do |t,args|
      find_user(args.email).grant!
    end
    desc 'Destroys the user and the person attached to it'
    task :destroy, [:email] => :environment do |t,args|
      find_user(args.email).destroy
    end
    
    private
    def find_user(email)
      puts email
      user = User.find_by_email(email)
      user
    end
  end
end