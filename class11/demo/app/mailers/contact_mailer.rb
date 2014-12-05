class ContactMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact_customer(email)
  	mail(to: email, subject: "Gracias por contactarnos" )
  end

  def contact_team
  	mail(to: "team@miempresa.com")
  end

end
