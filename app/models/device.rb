class Device < ActiveRecord::Base
  has_one :user_device
  has_one :user, through: :user_device
  validates_presence_of :name, :network_support
  validates_uniqueness_of :name

end
