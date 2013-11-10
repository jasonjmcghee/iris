class UserDevice < ActiveRecord::Base
  belongs_to :user
  belongs_to :device
  validates_presence_of :device_id, :user_id
  validates_uniqueness_of :device_id
  validate :data_exists_in_database, :relationship_does_not_exist

  def data_exists_in_database
    if self.user_id != nil and self.device_id != nil
      if !User.where(id: self.user_id).blank?
        if Device.where(id: self.device_id).blank?
          errors.add(self.device_id, "doesn't exist!")
        end
      else
        errors.add(self.user_id, "doesn't exist!")
      end
    end
  end

  def relationship_does_not_exist
    UserDevice.all.each do |e|
      if e.user_id == self.user_id then
        if e.device_id == self.device_id then
          errors.add(self.user_id, "already belongs to that device!")
        end
      end
    end
  end
end
