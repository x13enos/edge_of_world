require 'rails_helper'

describe Api::V1::CharactersController, :type => :controller do

  describe 'POST create' do
    login_user

    it 'should return success' do
      post 'create'
      expect(response).to be_success
    end

    context "when character created" do
      before do
        @character = double
        allow(@logged_in_user).to receive(:characters) { double(:build => @character) }
        allow(@character).to receive(:save) { true }
        post 'create'
      end

      it 'should return json stats' do
        expect(response.body).to eq({ :character => @character }.to_json)
      end

      it 'should return success code' do
        expect(response).to have_http_status(200)
      end
    end


    context "when character didn't create" do
      before do
        character = double(:errors => 'errors')
        allow(@logged_in_user).to receive(:characters) { double(:build => character) }
        allow(character).to receive(:save) { false }
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
