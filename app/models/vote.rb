class Vote < ApplicationRecord
  belongs_to :candidate, counter_cache: "vote"
end
