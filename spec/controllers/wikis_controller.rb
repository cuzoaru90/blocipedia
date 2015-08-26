require 'rails_helper'

include Devise::TestHelpers

describe WikisController do


  before do
    user = FactoryGirl.create(:user)
    sign_in user
  end


  describe '#create' do
    it "creates a new wiki for current user" do
    end

  end

  describe '#update' do

  end


  describe '#destroy' do

  end

end