namespace :user do
  namespace :admin do
    desc 'Grants admin privileges to specified user name'
    task :grant, [:name] => :environment do |t,args|      
      find_user(args.name).grant!
    end
    desc 'Grants admin privileges to specified user name'
    task :ungrant, [:name] => :environment do |t,args|
      find_user(args.name).ungrant!
    end
    private
    def find_user(name)
      puts name
      user = User.find_by_name(name)
      puts('Not found') or exit(2) unless user
      user
    end    
  end
end      
