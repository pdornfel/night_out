class NagMailer < ActionMailer::Base

  def send_message(nag)
    @nag = nag
    mail from: "admin@planwithfriends.com", to: "foo@gmail.com", subject: "You just got nagged"
  end

end