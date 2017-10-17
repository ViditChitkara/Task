class Contact < ApplicationRecord
  validates :email, presence: true
  has_many :mails
end
