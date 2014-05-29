class ApicallsController < ApplicationController

  def instagram

    instagram_api_url = "https://api.instagram.com/v1/users/" + current_user.uid + "/media/recent/?access_token="+ current_user.instagram_token
    @instagram_data = HTTParty.get instagram_api_url

  end




end