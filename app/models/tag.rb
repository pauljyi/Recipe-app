class Tag < ActiveRecord::Base
  validates :name, :presence => true

  belongs_to :recipe

  # def self.find_tag_names name
  #   Tag.where(:name => name)
  # end
end
