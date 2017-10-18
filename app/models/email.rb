class Email < ApplicationRecord

  def self.markRead id
    m = Email.find(id)
    m.update(:status => "read")
  end

end
