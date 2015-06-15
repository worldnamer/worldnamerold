require 'rails_helper'

describe MediaController do
  context '#index' do
    it 'only returns non-project links' do
      @user = create(:worldnamer)

      sign_in @user

      project = create(:project, user: @user)
      section = project.sections.create(name: 'links', section_type: 'links')
      project_link = section.links.create(title: 'title', excerpt: 'excerpt', url: 'url', user: @user)

      non_project_link = Link.create(title: 'title', excerpt: 'excerpt', url: 'url', user: @user)

      post :index

      expect(assigns(:links).count).to eq(1)
    end
  end
end