namespace :user do
  namespace :admin do
    desc 'Grants admin privileges to specified user email or login'
    task :grant, [:email] => :environment do |t,args|      
      find_user(args.email).grant!
    end
    desc 'Grants admin privileges to specified user email or login'
    task :ungrant, [:email] => :environment do |t,args|
    end
    private
    def find_user(email)
      puts email
      user = User.find_by_email(email)
      puts('Not found') or exit(2) unless user
      user
    end    
  end
end      
