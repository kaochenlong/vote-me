class Vote < ApplicationRecord
  belongs_to :candidate, counter_cache: "vote"
  belongs_to :user
end
