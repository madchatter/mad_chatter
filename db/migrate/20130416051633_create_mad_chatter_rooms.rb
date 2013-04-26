class CreateMadChatterRooms < ActiveRecord::Migration
  def change
    create_table :mad_chatter_rooms do |t|
      t.string :name
      t.references :owner

      t.timestamps
    end
  end
end
