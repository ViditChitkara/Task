class RenameMailsToEmails < ActiveRecord::Migration[5.1]
  def change
    rename_table :mails, :emails
  end
end
