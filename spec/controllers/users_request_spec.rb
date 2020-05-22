require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    before { get :new }

    it 'レスポンスコードが200であること' do
      expect(response).to have_http_status(:ok)
    end

    it 'newテンプレートをレンダリングする事' do
      expect(response).to render_template :new
    end

    it '新しいuserオブジェクトがビューに表示される事' do
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe 'POST #create' do
    context '正しいユーザー情報が渡ってきた場合' do
      let(:params) do
        { user: {
            name: 'user',
            password: 'password',
            password_confirmation: 'password'
          }
        }
      end

      it 'ユーザーが一人増えている事' do
        expect{ post :create, params: params }.to change(User, :count).by(1)
      end

      it 'マイページにリダイレクトされる事' do
        expect(post :create, params: params).to redirect_to(mypage_path)
      end
    end
  end
end
