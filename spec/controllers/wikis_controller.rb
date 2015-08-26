require 'rails_helper'

<<<<<<< HEAD
include Devise::TestHelpers

=======
>>>>>>> 09a19ca433ef4b5029c39b98bf2118bc6205dc3e
describe WikisController do


  before do
<<<<<<< HEAD
    user = FactoryGirl.create(:user)
    sign_in user
=======
  @user = User.new(name: "An user") 
>>>>>>> 09a19ca433ef4b5029c39b98bf2118bc6205dc3e
  end


  describe '#create' do
    it "creates a new wiki for current user" do
<<<<<<< HEAD
=======
       puts @user.wikis
       post :create, { title: 'name of wiki', body: 'body of wiki'}
>>>>>>> 09a19ca433ef4b5029c39b98bf2118bc6205dc3e
    end

  end

  describe '#update' do

  end


  describe '#destroy' do

  end

end