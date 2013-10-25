class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :wired_mac
      t.string :wireless_mac
      t.string :network_support
      t.string :security_alert

      t.timestamps
    end
  end
end
