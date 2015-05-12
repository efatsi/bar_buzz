class Core < ActiveRecord::Base
  has_many :means
  has_many :variances
end
