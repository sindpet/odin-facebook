class Comment < ApplicationRecord
  include Likeable

  belongs_to :user
  belongs_to :post, counter_cache: true
end
