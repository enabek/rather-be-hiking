class Article < ActiveRecord::Base
  validates :title, :body, presence: true

  belongs_to :writer, class_name: "User"
  has_many :comments
end
