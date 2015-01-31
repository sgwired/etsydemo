class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "200>", :thumb => "100x100>" }, :default_url => "notfound.jpg",
	else
		has_attached_file :image, :styles => { :medium => "200>", :thumb => "100x100>" }, :default_url => "notfound.jpg",
						  :storage => :dropbox,
						  :dropbox_credentials => Rails.root.join("config/dropbox.yml")
						  :path => ":style/:id_:filename"
  		#validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  	end	
end
