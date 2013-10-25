class User < ActiveRecord::Base
  validates_presence_of :name, :email
  validate_uniqueness_of :email
end
