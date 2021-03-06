require 'spec_helper'

describe UsersController do
  describe "GET #index" do

    it "populates an array of users " do
     user = FactoryGirl.create(:user)
     get :index
     assigns(:users).should eq(User.all)
    end

    it "renders the :index view" do
     get :index
     response.should render_template :index
   end
  end

 describe "GET #show" do
    it "assigns the requested user to @user" do
     user = FactoryGirl.create(:user)
     get :show, id: user
     assigns(:user).should eq(user) 
    end

    it "renders the :show view" do
     get :show, id: FactoryGirl.create(:user)
     response.should render_template :show
    end
  end

    describe 'POST #create' do
    context 'with valid attributes' do
       
      it 'saves new user in database' do
      @attr = {:name => "Joel", :familyName => "Dicker", :userType => "admin", :email => "joel.dicker@email.com"}
        @user = FactoryGirl.create(:user, @attr)
        User.stub!(:new).and_return(@user)
        @user.should_receive(:save).and_return(true)
        
      end

      it 'redirects to assignments_path' do 
        post :create, :user => @attr
        response.should redirect_to @user
      end
    end

    context 'with invalid attributes' do
      it 'saves new user in database' do
        expect{
          post :create, user: FactoryGirl.attributes_for(:invalid_user)
          }.to_not change(User, :count)
      end

      it 're-renders the :new template' do
          post :create, user: FactoryGirl.attributes_for(:invalid_user)
          response.should render_template :new
      end
    end
end
end
