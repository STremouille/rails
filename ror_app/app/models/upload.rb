class Upload < ActiveRecord::Base
	attr_accessible :content   
	
	has_attached_file :content,
  :path => ':rails_root/app/assets/uploads/:attachment/:id/:style/:filename.:content_type_extension',
  :url => ':attachment/:id/:style/:filename.:content_type_extension',
  :name => ':filename'
end
