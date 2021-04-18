# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    UserMailer.welcome(User.first)
  end

  # http://localhost:3000/rails/mailers/user_mailer/requested_space
  def requested_space
    UserMailer.requested_space(User.first,Listing.first)
  end
end
