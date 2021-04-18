# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    UserMailer.welcome(User.first)
  end

  # http://localhost:3000/rails/mailers/user_mailer/requested_space
  def requested_space
    UserMailer.requested_space(User.first,Request.first) 
  end

  def accepted_email
    UserMailer.request_decision(User.first,Request.first,"accept")
  end

  def denied_email
    UserMailer.request_decision(User.first,Request.first,"deny")
  end
end
