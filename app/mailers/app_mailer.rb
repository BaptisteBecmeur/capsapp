class AppMailer < ActionMailer::Base

  def new_reservation(prestation, reservation)
    @user = User.find(prestation.user_id)
    @reservation = reservation
    @prestation = prestation
    mail(from: 'Capsss <no-reply@capsss.com>', to: @user.email, subject: "Nouvelle réservation !")
  end
end
