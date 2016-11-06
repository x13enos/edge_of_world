class Api::V1::CharactersController < Api::V1::BaseController
  include Api::V1::CharactersDocumentation

  def create
    builder = Game::Characters::Creating.new(current_user)
    if builder.perform
      render :json => { :character => builder.character }, :status => 200
    else
      render :json => { :errors => builder.errors }, :status => 422
    end
  end

end
