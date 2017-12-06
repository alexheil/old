class EmailMailerPreview < ActionMailer::Preview
  # Accessible from http://localhost:3000/rails/mailers/email/welcome
  def email_blast
    EmailMailer.email_blast(Email.first)
  end
end