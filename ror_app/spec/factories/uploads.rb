FactoryGirl.define do
  factory :upload do |f|
    f.name "TestDocument"
    f.ownerId "1"
    f.description "I'm a test Document"
    f.uploadGroup "admin"
  end
end
