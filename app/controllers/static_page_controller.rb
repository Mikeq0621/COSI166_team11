class StaticPageController < ApplicationController
  skip_before_action :require_login

  def home
  end

  def faq
  end
end
