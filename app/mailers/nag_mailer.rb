class NagMailer < ActionMailer::Base

  def send_message(nag)
    @nag = nag
    emails = format_email
    mail from: "admin@planwithfriends.com", to: emails, subject: "You just got nagged"
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


