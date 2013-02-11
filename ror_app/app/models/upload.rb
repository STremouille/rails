class Upload < ActiveRecord::Base
	attr_accessible :content, :description, :name, :uploadGroup, :ownerId

  validates :name , :presence => true
  validates :ownerId , :presence => true
	def self.search(search)
    if search
        find(:all, :conditions => ['name LIKE ? OR description LIKE ?', "%#{search}%","%#{search}%"])
    else
        find(:all)
    end    
  end

  def self.searchForGroup(fgroup)
    find(:all, :conditions => ['uploadGroup LIKE ? ', "%#{fgroup}%"])
  end

  def self.searchForOwned(id)
    find(:all, :conditions => ['ownerId LIKE ? ', "%#{id}%"])
  end
	
	has_attached_file :content,
  :path => ':rails_root/app/assets/uploads/:attachment/:id/:style/:filename',
  :url => ':attachment/:id/:style/:filename',
  :fileName => ':filename'
end
