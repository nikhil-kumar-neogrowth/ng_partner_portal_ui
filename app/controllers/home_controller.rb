class HomeController < ApplicationController
  def index
    @mainTitle = "Welcome to Partner Portal"
    @mainDesc = "It is an application built on Rails web app. It is used to view applications and investement details by partners of Neogrowth."
  end

  def minor
  end

  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end

  def get_user_details
    # not able to render this as of now, need to fix
    extra_attributes = session[:cas_extra_attributes]
    user_name = session[:cas_user]
    render json: {attributes: extra_attributes, user_name: user_name}
  end

end
