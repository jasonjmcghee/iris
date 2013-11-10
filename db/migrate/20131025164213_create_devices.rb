class CreateDevices < ActiveRecord::Migration
  def change
    drop_table :devices
    create_table :devices do |t|
      t.string :name
      t.string :network_support
      t.string :security_alert

      t.timestamps
    end
  end
end
