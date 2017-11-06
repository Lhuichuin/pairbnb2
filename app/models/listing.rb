class Listing < ApplicationRecord

	belongs_to :user
	has_many :reservations
	acts_as_taggable_on :amenities, :safety_features
	mount_uploaders :photos, PhotosUploader

	# def self.search(search)
	# 	where("title ILIKE ? OR country ILIKE ?", "%#{search}%", "%#{search}%")		
	# end

# def self.search(search)
#   where("name LIKE ?", "%#{search}%") 
#   where("content LIKE ?", "%#{search}%")
# end


		def self.search(title, country)
		where("title ILIKE ? AND country ILIKE ?", "%#{title}%", "%#{country}%" )		
	end

end
