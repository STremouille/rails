FactoryGirl.define do
 factory :invalid_user, parent: :user do |f|
 f.name nil
 end
end
