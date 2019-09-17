class ContactMailer < ActionMailer::Base
  default to: 'mhboneill@hotmail.com'

  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body

    mail(from: email, sibject: 'Contact Form Message')
  end

end
