class Api::V1::CharactersController < Api::V1::BaseController
  include Api::V1::CharactersDocumentation

  def create
    character = current_user.characters.build
    if character.save
      render :json => { :character => character }, :status => 200
    else
      render :json => { :errors => character.errors }, :status => 422
    end
  end

end
