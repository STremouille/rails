#
# This model represent an upload which is modelized by a name, a little text description, a share group, an owner and a content (the uploaded file in question).
# It ensures multiple validations methods : the name and the owner can't be blank and the uploaded file can't be more than 10 Mb

class Upload < ActiveRecord::Base
	attr_accessible :content, :description, :name, :uploadGroup, :ownerId

  validates :name , :presence => true
  validates :ownerId , :presence => true
  validates_attachment_size :content, :less_than => 10.megabyte , :message => "Upload must be less than 10Mb"


  #Return a list of uploads aswering the search by matching in the database
	def self.search(search)
    if search
        find(:all, :conditions => ['name LIKE ? OR description LIKE ?', "%#{search}%","%#{search}%"])
    else
        find(:all)
    end    
  end

  #Return the user matching the corresponding upload group
  def self.searchForGroup(fgroup)
    find(:all, :conditions => ['uploadGroup LIKE ? ', "%#{fgroup}%"])
  end

  #Return the user matching the corresponding owner
  def self.searchForOwned(id)
    find(:all, :conditions => ['ownerId LIKE ? ', "%#{id}%"])
  end
  #Function call to switch the owner id for deleted user to the anonymous one
  def self.switchToAnonymous(ownerId)
    uploads = searchForOwned(ownerId)
    uploads.each do |up|
      up.ownerId=1
      puts up
      up.save
    end
  end

	has_attached_file :content,
  :path => ':rails_root/app/assets/uploads/:attachment/:id/:style/:filename',
  :url => ':attachment/:id/:style/:filename',
  :fileName => ':filename'
end
