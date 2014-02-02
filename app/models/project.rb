class Project < ActiveRecord::Base
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
 validates_attachment_size :avatar, :less_than => 20.megabytes

end
