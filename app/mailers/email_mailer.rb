class EmailMailer < ApplicationMailer

  def email_blast(email)
    @email = email
    mail(to: @email.email, subject: ' | Halowake')
  end

end