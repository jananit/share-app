class Project < ActiveRecord::Base
  require 'bitly'
 attr_accessible  :avatar

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }, :s3_headers => { 'Cache-Control' => 'max-age=315576000', 'Expires' => 1.minutes.from_now } 
    

	# validates_attachment_content_type :avatar, :content_type => /(image\/(jpeg|jpg|gif|png))/, :message=>"Sorry - invalid file type. Please upload a .jpg, .gif or .png"
	  # validates_attachment :avatar, :content_type => { :content_type => "image/jpg" }
validates_attachment :avatar, :presence => {:message=>"Please choose a file from your system and then press upload."},
  :content_type => { :content_type => /(image\/(jpeg|jpg|gif|png))|(application\/(msword|vnd.oasis.opendocument.text|pdf))/ ,:message =>"Invalid Format" },
  :size => { :in => 0..20.megabytes,:message =>"File Should less than 20 MB  " }

def get_shorten_url
   bitly = Bitly.client
   # bitly.shorten(avatar.url).short_url
 return bitly.shorten("https://www.facebook.com/").short_url
end

end
