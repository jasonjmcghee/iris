class UserMac < ActiveRecord::Base
  belongs_to :user
  belongs_to :mac_address
  validates_presence_of :user_id, :mac_address_id
  validate :data_exists_in_database, :relationship_does_not_exist

  def data_exists_in_database
    if self.user_id != nil and self.mac_address_id != nil
      if !User.where(id: self.user_id).blank?
        if MacAddress.where(id: self.mac_address_id).blank?
          errors.add(:mac_address_id, "doesn't exist!")
        end
      else
        errors.add(:user_id, "doesn't exist!")
      end
    end
  end

  def relationship_does_not_exist
    UserMac.all.each do |e|
      if e.user_id == self.user_id then
        if e.mac_address_id == self.mac_address_id then
          errors.add(:user_id, "already belongs to that mac_address!")
        end
      end
    end
  end

end
