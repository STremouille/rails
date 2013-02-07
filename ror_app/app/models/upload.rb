class Upload < ActiveRecord::Base
	attr_accessible :content, :description, :name
	
	has_attached_file :content,
  :path => ':rails_root/app/assets/uploads/:attachment/:id/:style/:filename',
  :url => ':attachment/:id/:style/:filename',
  :fileName => ':filename'
end
