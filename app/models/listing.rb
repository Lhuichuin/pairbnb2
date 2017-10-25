class Listing < ApplicationRecord

	belongs_to :user

	acts_as_taggable_on :amenities, :safety_features

	def self.search(search)
		where("title ILIKE ? OR country ILIKE ?", "%#{search}%", "%#{search}%")		
	end
end
