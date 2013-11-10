class CreateUserMacs < ActiveRecord::Migration
  def change
    create_table :user_macs do |t|
      t.belongs_to :user
      t.belongs_to :mac_address

      t.timestamps
    end
  end
end
