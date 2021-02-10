class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates_presence_of :body
  validates_length_of :body, minimum: 1
end
