require 'rails_helper'

describe WikisController do


  before do
  @user = User.new(name: "An user") 
  end


  describe '#create' do
    it "creates a new wiki for current user" do
       puts @user.wikis
       post :create, { title: 'name of wiki', body: 'body of wiki'}
    end

  end

  describe '#update' do

  end


  describe '#destroy' do

  end

end