class CreateMacAddresses < ActiveRecord::Migration
  def change
    create_table :mac_addresses do |t|
      t.string :address
      t.string :mac_type

      t.timestamps
    end
  end
end
