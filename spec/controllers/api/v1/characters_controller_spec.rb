require 'rails_helper'

describe Api::V1::CharactersController, :type => :controller do

  describe 'POST create' do
    login_user

    context "when character created" do
      before do
        builder = double(:character => 'character')
        allow(Game::Characters::Creating).to receive(:new).with(@logged_in_user) { builder }
        allow(builder).to receive(:perform) { true }
        post 'create'
      end

      it 'should return json stats' do
        expect(response.body).to eq({ :character => 'character' }.to_json)
      end

      it 'should return success code' do
        expect(response).to have_http_status(200)
      end
    end


    context "when character didn't create" do
      before do
        builder = double(:errors => 'errors')
        allow(Game::Characters::Creating).to receive(:new).with(@logged_in_user) { builder }
        allow(builder).to receive(:perform) { false }
        post 'create'
      end

      it 'should return json errors' do
        expect(response.body).to eq({ :errors => 'errors' }.to_json)
      end

      it 'should return fail code' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
