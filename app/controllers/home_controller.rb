class HomeController < ApplicationController

  def index
  end

  def file_upload
    email_ids = save_contacts(params[:file])
  end

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

end
