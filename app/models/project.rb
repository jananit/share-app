class Project < ActiveRecord::Base
  attr_accessible :avatar
  # has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
# has_attached_file :avatar,
#   :storage => :s3, 
#   :s3_credentials => "#{Rails.root}/config/s3.yml",
#   :path => "project/:style/:id/:filename"
#  validates_attachment_size :avatar, :less_than => 20.megabytes

end
