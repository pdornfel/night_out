class Mailer < ActionMailer::Base

  def send_nag(nag)
    @nag = nag
    emails = format_email
    mail from: "admin@planwithfriends.com", to: emails, subject: "You just got nagged"
  end

  def send_invitation(email, group)
    @group = Group.find(group)
    @email = email
    mail from: "admin@planwithfriends.com", to: email, subject: "You have been invited to Plan With Friends"
  end

  private

  def format_email
    emails_string = String.new
    @nag.group.users.each do |user|
      emails_string << "#{user.email}, "
    end
    emails_string.chop!.chop!
  end

end


