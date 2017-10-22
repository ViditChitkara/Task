class Email < ApplicationRecord
  paginates_per 12

  def self.markRead id
    m = Email.find(id)
    m.update(:status => "read")
  end

end
