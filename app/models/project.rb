class Project < ActiveRecord::Base
 attr_accessible  :avatar

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

	# validates_attachment_content_type :avatar, :content_type => /(image\/(jpeg|jpg|gif|png))/, :message=>"Sorry - invalid file type. Please upload a .jpg, .gif or .png"
	  # validates_attachment :avatar, :content_type => { :content_type => "image/jpg" }
validates_attachment :avatar, :presence => {:message=>"Please choose a file from your system and then press upload."},
  :content_type => { :content_type => /(image\/(jpeg|jpg|gif|png))|(application\/(msword|vnd.oasis.opendocument.text|pdf))/ ,:message =>"Invalid Format" },
  :size => { :in => 0..20.megabytes,:message =>"File Should less than 20 MB  " }
def download_url
    s3 = AWS::S3.new
    bucket = s3.buckets['janani_development']
    object = bucket.objects["AKIAJYBWIXLV3SVXG7PA"]
    object.url_for(:get, {
      expires: 10.minutes,
      response_content_disposition: 'attachment;'
    }).to_s
  end


end
