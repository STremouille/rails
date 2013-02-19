require 'faker'
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do |f|
    f.name  { Faker::Name.first_name }
    f.familyName  { Faker::Name.last_name }
    f.email { Faker::Internet.email }
    f.userType "admin"
    f.age 26
    f.avatar {fixture_file_upload(Rails.root.join(*%w[ spec support images mandy.jpg]), 'image/jpg')}
  end
end
