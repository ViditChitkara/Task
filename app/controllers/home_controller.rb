class HomeController < ApplicationController

  def index
  end

  def file_upload
    email_ids = save_contacts(params[:file])
    subject = params[:subject]
    content = params[:content]
    email_ids.each do |e|
      receiver = Contact.find_by_email(e)
      content_user_specific = message_for_receiver(receiver,content.dup)
      email_instance = Email.create(:sender => current_user.email, :receiver => e, :content => content_user_specific)
      if valid_content(content_user_specific)
        MessageMailer.index(current_user,e,content_user_specific,subject,email_instance).deliver_later
      else
        email_instance.update(:status => "user info in email not complete")
      end
    end
    return redirect_to '/'
  end

  private 

  def save_contacts file
    email_ids = []
    book = Roo::Spreadsheet.open(file.path, file_warning: :ignore,
                          extension: File.extname(file.original_filename),
                          csv_options: { col_sep: ';', converters: :all })

    header = book.row(1)
    arr=[]
    header.each do |h|
      str = h.split(" ").join("_").downcase
      arr.push(str)
    end
    header = arr

    (2..book.last_row).each do |i|
      row = Hash[[header, book.row(i)].transpose]
      row.each_key{|x| row[x] = row[x].to_s.strip if row[x]}
      c = Contact.find_by_email(row["email"])
      if c.nil?
        Contact.create(row)
      else
        c.update(row.except("email"))
      end
      email_ids << row["email"]
    end
    email_ids
  end

  def message_for_receiver contact,template
    probables = Contact.column_names - ["id","created_at","updated_at"]
   
    probables.each do |p|
      pattern = "##"+p+"##"
      template.gsub!(pattern,contact[p]) unless (contact[p].nil?||contact[p].empty?)
    end
    template
  end

  def valid_content content
    content.match(/##\b\S+?\b##/).nil?
  end

end
