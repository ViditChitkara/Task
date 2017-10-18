class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.index.subject
  #
  def index sender,receiver,content,subject,email
    @email = email
    @content = content
    mail(to: receiver, subject: subject, reply_to: sender.email)
  end

end
