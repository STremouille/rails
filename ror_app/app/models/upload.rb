class Upload < ActiveRecord::Base
	attr_accessible :content, :description, :name, :uploadGroup

	def self.search(search)
    if search
        find(:all, :conditions => ['name LIKE ? OR description LIKE ?', "%#{search}%","%#{search}%"])
    else
        find(:all)
    end
    
end
	
	has_attached_file :content,
  :path => ':rails_root/app/assets/uploads/:attachment/:id/:style/:filename',
  :url => ':attachment/:id/:style/:filename',
  :fileName => ':filename'
end
