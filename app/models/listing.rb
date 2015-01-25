class Listing < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "200>", :thumb => "100x100>" }, :default_url => "notfound.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
