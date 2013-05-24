class Asset < ActiveRecord::Base

  attr_accessible :data, :title
  has_attached_file :data,
  	:styles => {
    :medium => "300x300>",
    :thumb => "50x50>"},
    :storage => :dropbox,
    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
    :dropbox_options => {
    :path => proc { |style| "k_img/#{style}/#{id}_#{data.original_filename}" }
    }

	before_save :set_title_from_file_name

  include Rails.application.routes.url_helpers


  def to_jq_upload
    {
      "name" => read_attribute(:data_file_name),
      "size" => read_attribute(:data_file_size),
      "url" => data.url(:thumb),
      "delete_url" => asset_path(self),
      "delete_type" => "DELETE"
    }
  end

	private
	def set_title_from_file_name
		title = read_attribute(:data_file_name)
	end

end
