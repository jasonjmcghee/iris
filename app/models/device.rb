class Device < ActiveRecord::Base

  belongs_to :user
  validates_presence_of :name, :network_support
  validate :mac_address
  validates_uniqueness_of :name
  validates_uniqueness_of :wired_mac, :allow_blank => true
  validates_uniqueness_of :wireless_mac, :allow_blank => true

  def mac_address
    mac_regex = "^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$"

    if self.wired_mac == '' and self.wireless_mac == ''
      errors.add(:wired_mac, "must have one type of mac address.")
      errors.add(:wireless_mac, "must have one type of mac address.")
    elsif self.wired_mac != '' and self.wired_mac != nil
      if !(/#{mac_regex}/.match(self.wired_mac))
        errors.add(:wired_mac, "must have the form xx:xx:xx:xx:xx.")
      end
    elsif self.wireless_mac != '' and self.wireless_mac != nil
      if !(/#{mac_regex}/.match(self.wireless_mac))
        errors.add(:wireless_mac, "must have the form xx:xx:xx:xx:xx.")
      end
    end
  end

end
