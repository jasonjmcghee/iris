class User < ActiveRecord::Base
  has_many :user_devices
  has_many :devices, through: :user_devices
  has_many :user_macs
  has_many :mac_addresses, through: :user_macs
  validates_presence_of :name, :login
  validates_uniqueness_of :login
end
