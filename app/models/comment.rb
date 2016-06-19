class Comment < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :article
  belongs_to :writer, class_name: "User"
end
