class Recipe < ActiveRecord::Base
  validates :title, :presence => true
  # validates :author, :presence => true
  validates :ingredients, :presence => true
  validates :instructions, :presence => true

  has_many :tags, :dependent => :destroy

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # validates_attachment :image, presence: true,
  #   content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
  #   size: { in: 0..10.megabytes }
end
