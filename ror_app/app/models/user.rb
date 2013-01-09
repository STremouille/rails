class User < ActiveRecord::Base
  attr_accessible :age, :familyName, :name, :userTypes_attributes, :profilImgUrl

  validates :familyName , :presence => true
  validates :name , :presence => true

  has_many :comments, :dependent => :destroy
  has_many :userTypes

  accepts_nested_attributes_for :userTypes, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
