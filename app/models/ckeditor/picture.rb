class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :url  => "/#{config.upload_path}/pictures/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/#{config.upload_path}/pictures/:id/:style_:basename.:extension",
                    :styles => { :content => '800>', :thumb => '118x100#' }

  validates_attachment_size :data, :less_than => config.max_picture_size
  validates_attachment_presence :data
  validates_attachment_content_type :data, :content_type => %w(image/jpeg image/jpg image/png image/gif)

  def url_content
    url(:content)
  end
end
