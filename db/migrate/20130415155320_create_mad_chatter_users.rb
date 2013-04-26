class CreateMadChatterUsers < ActiveRecord::Migration
  def change
    create_table :mad_chatter_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :encrypted_password

      t.timestamps
    end
  end
end
