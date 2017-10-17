class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone_no
      t.string :discount
      t.string :address

      t.timestamps
    end
  end
end
