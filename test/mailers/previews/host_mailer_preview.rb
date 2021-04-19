# Preview all emails at http://localhost:3000/rails/mailers/host_mailer
class HostMailerPreview < ActionMailer::Preview

    def welcome
        HostMailer.welcome(Host.first)
    end

    def request
        HostMailer.request_notification(Request.first)
    end

    def transaction
        HostMailer.transaction(Transaction.first)
    end
end
