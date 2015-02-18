class Sub < ActiveRecord::Base
    belongs_to :user
    belongs_to :cluster
end
