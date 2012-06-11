require 'spec_helper'

describe ListsController do
	include Devise::TestHelpers
	before :each do
		@user = Factory(:user)
		sign_in @user
	end
	it 'should return all lists' do
		list = @user.list.create!(:title=>"Title")
		list_2 = @user.list.create!(:title=>"Title2")
		get 'index'
    assigns(:lists)[0].title.should == list.title
		assigns(:lists)[1].title.should == list_2.title
	end
	it 'showl list' do
		list = @user.list.create!(:title=>"Title")
		params = {:id => list.id}
		get 'show', params
    assigns(:list).title.should == list.title
	end

	it 'edit list' do
		list = @user.list.create!(:title=>"Title")
		params = {:id => list.id}
		get 'edit', params
    assigns(:list).title.should == list.title
	end

	it 'create list' do
		params = {:list=>{:title=>"Title"}}
		post 'create', params
    @user.list[0].title.should == params[:list][:title]
	end

	it 'update' do
		list = @user.list.create!(:title=>"Title")
		params = {:id => list.id,:list=>{:title=>"Title2"}}
		post 'update',params
    @user.list[0].title.should == params[:list][:title]
	end

	it 'delete list' do
		list = @user.list.create!(:title=>"Title")
		params = {:id => list.id}
		post 'destroy',params
    @user.list.empty?.should be_true 
	end
	
	it 'share task' do
	  share_user = Factory(:user,:email=>"vseprav@ukr.net")
	  list = @user.list.create!(:title=>"Title share list")
	  params = {:email=>share_user.email,:list=>{:id=>list.id}}
	  get 'share_list', params
	  share_user.list[0].title.should == list.title
	end
	
end
