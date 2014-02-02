class Project < ActiveRecord::Base
 attr_accessible  :avatar

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

	validates_attachment_content_type :avatar, :content_type => /(image\/(jpeg|jpg|gif|png))/, :message=>"Sorry - invalid file type. Please upload a .jpg, .gif or .png"
	  # validates_attachment :avatar, :content_type => { :content_type => "image/jpg" }
end
