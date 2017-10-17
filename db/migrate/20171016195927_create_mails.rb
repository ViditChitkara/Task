class CreateMails < ActiveRecord::Migration[5.1]
  def change
    create_table :mails do |t|
      t.string :sender
      t.string :receiver
      t.text :content
      t.string :status

      t.timestamps
    end
  end
end
