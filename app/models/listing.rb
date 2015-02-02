class Listing < ActiveRecord::Base
if Rails.env.production?
has_attached_file :image,
:styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg",
:storage => :dropbox,
:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
:path => ":style/:id_:filename"
validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)
belongs_to :user
else
has_attached_file :image,
:styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"
# Previous code from earlier lecture (25 or 26). Lines 13 & 19-24 added for lecture 27.
validates :name, :description, :price, presence: true
validates :price, numericality: { greater_than: 0 }
validates_attachment_presence :image
validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)
belongs_to :user
end
end 