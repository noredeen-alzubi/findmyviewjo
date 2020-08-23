class Review < ApplicationRecord
  belongs_to :user
  belongs_to :stunning_view, counter_cache: true
end
