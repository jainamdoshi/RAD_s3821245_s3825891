class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  @@emailRegex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
end
