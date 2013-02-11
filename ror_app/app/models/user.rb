class User < ActiveRecord::Base
  TYPE = %w(Admin Teacher Student)

  attr_accessible :age, :familyName, :name, :userType, :avatar

  validates :familyName , :presence => true
  validates :name , :presence => true
  validates :userType, :presence => true
  
  def self.search(search)
    if search
        find(:all, :conditions => ['name LIKE ? OR familyName LIKE ?', "%#{search}%","%#{search}%"])
    else
        find(:all)
    end
  end

  has_many :comments, :dependent => :destroy
  
	#Avatar picture
	validates_attachment_content_type :avatar, :content_type=>['image/jpeg', 'image/png', 'image/gif'], :message=>"Avatar must be jpeg|png|gif"
	validates_attachment_size :avatar, :less_than => 1.megabyte , :message => "Avatar picture must be less than 1Mb"

	has_attached_file :avatar,
  :path => ':rails_root/app/assets/images/:attachment/:id/:style/:filename.:content_type_extension',
  :url => ':attachment/:id/:style/:filename.:content_type_extension',
  :styles => {
      :thumb => "50x50#",
      :small  => "150x150>",
      :medium => "300x300" }

end


#Generating/regenerating your thumbnails
#You can (re)generate your thumbnails en masse with Paperclip’s rake tasks. Using our example class above:

#rake paperclip:refresh:thumbnails CLASS=User

#or to refresh all of your defined styles in one go (:thumb, :small, :medium from the above example)

#rake paperclip:refresh CLASS=User

#and to refresh only missing styles:
#a list of styles will be defined or updated in a file “/public/system/paperclip_attachments.yml”

#rake paperclip:refresh:missing_styles

#If you are using the gem required version of paperclip the rake tasks may not be auto-loaded, but you can copy them into your lib/tasks directory if needed.

#If you need more manual control or have a lot of thumbnails and only want to process a few, you can use #reprocess! like so:

#users_to_reprocess.each do |user|
#  user.photo.reprocess!
#end
