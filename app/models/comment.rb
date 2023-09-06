class Comment < ApplicationRecord
  include Likeable

  validates :body, length: { minimum: 1 }, allow_blank: false

  belongs_to :user
  belongs_to :post, counter_cache: true
end
