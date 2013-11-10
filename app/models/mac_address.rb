class MacAddress < ActiveRecord::Base
  has_one :user_mac
  has_one :user, through: :user_mac
  validates_presence_of :address, :mac_type
  validates_uniqueness_of :address
  validate :mac_address

  def mac_address
    mac_regex = "^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$"

    if !(/#{mac_regex}/.match(self.address))
      errors.add(:address, "must have the form xx:xx:xx:xx:xx:xx (':' can be '-')")
    end
  end
end
