class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.index.subject
  #
  def index receiver,content,message,subject,email
    @email = email
    @content = content
    mail(to: receiver, subject: subject)
  end

  # def full_from(user)
  #   address = Mail::Address.new user.email
  #   address.format
  # end

end
