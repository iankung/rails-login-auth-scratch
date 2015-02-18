class Cluster < ActiveRecord::Base
    has_many :posts
    has_many :subs
end
