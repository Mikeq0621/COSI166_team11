# To deliver this notification:
#
# RequestNotification.with(post: @post).deliver_later(current_user)
# RequestNotification.with(post: @post).deliver(current_user)


class RequestNotification < Noticed::Base
  # Add your delivery methods
  #
  # deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  # def message
  #   t(".message")
  # end
  #
  # def url
  #   post_path(params[:post])
  # end

  deliver_by :database
  param :listing
  param :user

  def to_database
    {
      params:params
    }
  end
  def message
    t('.message',address:params[:listing].host.address)
  end

  def url
    listing_path(params[:listing])
  end
end
