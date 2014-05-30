class CollagesController < ApplicationController

def index
   @photos = Collagephoto.where("user_id = #{current_user.id}")
   @div_classes = ['small', 'small', 'small', 'medium', 'medium', 'medium', 'medium', 'large']
end

def create
  instagram_api_url = "https://api.instagram.com/v1/users/" + current_user.uid + "/media/recent/?access_token="+ current_user.instagram_token
  @instagram_data = HTTParty.get instagram_api_url
    
    @instagram_data['data'].each do | image |
      
      @image_url = image['images']['standard_resolution']['url']

        if Collagephoto.where(:image_url => "#{@image_url}").blank?
          @collagephoto = Collagephoto.new
          @collagephoto.image_url = @image_url
          @collagephoto.user_id = current_user.id
          @collagephoto.save

            if Collagephoto.count > 20
              @last_photo = Collagephoto.first
              @last_photo.destroy
            end
        end
      
      end
      
      redirect_to collages_path

  end

end
