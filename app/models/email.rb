class Email < ApplicationRecord
  # belongs_to :user, :class_name => 'User', :foreign_key => 'sender'
  # belongs_to :contact, :class_name => 'Contact', :foreign_key => 'receiver'

  def self.markRead id
    m = Email.find(id)
    m.update(:status => "read")
  end

end
