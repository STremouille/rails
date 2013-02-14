require 'faker'
 

namespace :db do
desc "Fill database with the anonymous user"
task :populate => :environment do
    make_anonymous
  end
end


def make_anonymous

anonymous = User.create!( :id => 13,
						  :name => "user",
                          :familyName => "deleted",
                          :email => "t@t.fr",
                          :userType => "Student",
                          :age => 0,
                          :avatar => nil)
anonymous.save
end