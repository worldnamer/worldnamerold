require 'rails_helper'

describe ShippingController do
  context '#export' do
    it 'exports files' do
      @user = create(:worldnamer)

      sign_in @user

      get :export

      files = assigns(:files)

      expect(files[:projects]).to be_present
      expect(files[:todos]).to be_present
      expect(files[:snippets]).to be_present
      expect(files[:goals]).to be_present
      expect(files[:links]).to be_present
    end
  end
end