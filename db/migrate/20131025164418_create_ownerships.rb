class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.string :user_email
      t.string :device_name

      t.timestamps
    end
  end
end
