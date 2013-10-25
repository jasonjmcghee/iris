class Ownership < ActiveRecord::Base
  validates_presence_of :device_name, :user_email
  validates_uniqueness_of :device_name
  validate :data_exists_in_database, :ownership_exists

  def data_exists_in_database
    if self.user_email != nil and self.device_name != nil
      if !User.where(email: self.user_email).blank?
        if Device.where(name: self.device_name).blank?
          errors.add(self.device_name, "doesn't exist!")
        end
      else
        errors.add(self.user_email, "doesn't exist!")
      end
    end
  end

  def ownership_exists
    Ownership.all.each do |e|
      if e.user_email == self.user_email then
        if e.device_name == self.device_name then
          errors.add(self.user_email, "already belongs to that device!")
        end
      end
    end
  end
end
