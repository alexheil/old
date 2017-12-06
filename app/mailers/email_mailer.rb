class EmailMailer < ApplicationMailer

  def email_blast(email)
    @email = email
    @group = Group.find(2)
    mail(to: @email.email, subject: ' | Halowake')
  end

end