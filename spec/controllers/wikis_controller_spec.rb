require 'rails_helper'
include RandomData

RSpec.describe WikisController, type: :controller do

  let(:my_wiki) { Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false) }

  let(:my_user) { FactoryGirl.create(:user, email: "user@blocipedia.com", password: "password") }


  describe "GET #index" do
    it "returns http success" do
      sign_in my_user
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_wiki] to @wikis" do
      sign_in my_user
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      sign_in my_user
      get :show, {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      sign_in my_user
      get :show, {id: my_wiki.id}
      expect(response).to render_template :show
    end

     it "assigns my_wiki to @wiki" do
       sign_in my_user
      get :show, {id: my_wiki.id}
      expect(assigns(:wiki)).to eq(my_wiki)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      sign_in my_user
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      sign_in my_user
      get :new
      expect(response).to render_template :new
    end

     it "instantiates @wiki" do
      sign_in my_user
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Wiki by 1" do
      sign_in my_user
      expect{post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false}}.to change(Wiki,:count).by(1)
    end

    it "assigns the new wiki to @wiki" do
      sign_in my_user
      post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false}
      expect(assigns(:wiki)).to eq Wiki.last
    end

    it "redirects to the new wiki" do
      sign_in my_user
      post :create, wiki: {title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false}
      expect(response).to redirect_to Wiki.last
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      sign_in my_user
      get :edit, { id: my_wiki.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      sign_in my_user
      get :edit, { id: my_wiki.id }
      expect(response).to render_template :edit
    end
  end

   describe "PUT update" do
    it "updates wiki with expected attributes" do
      sign_in my_user
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, id: my_wiki.id, wiki: {title: new_title, body: new_body}

      updated_wiki = assigns(:wiki)

      expect(updated_wiki.id).to eq my_wiki.id
      expect(updated_wiki.title).to eq new_title
      expect(updated_wiki.body).to eq new_body
    end

    it "redirects to the updated wiki" do
      sign_in my_user
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, id: my_wiki.id, wiki: {title: new_title, body: new_body}

      expect(response).to redirect_to my_wiki
    end
  end

   describe "DELETE destroy" do
    it "deletes the wiki" do
      sign_in my_user
      delete :destroy, {id: my_wiki.id}

      count = Wiki.where({id: my_wiki.id}).size
      expect(count).to eq 0
    end

    it "redirects to wiki index" do
      sign_in my_user
      delete :destroy, {id: my_wiki.id}
      expect(response).to redirect_to wikis_path
    end
  end
end
