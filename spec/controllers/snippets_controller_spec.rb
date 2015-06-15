require 'rails_helper'

describe SnippetsController do
  context '#create' do
    it 'sets the user on the project links' do
      @user = create(:worldnamer)

      sign_in @user

      project = create(:project, user: @user)
      section = project.sections.create(name: 'links', section_type: 'links')

      post :create, project_id: project.id, section_id: section.id, link: {title: 'title', excerpt: 'excerpt', url: 'url'}

      expect(Link.first.user).to eq(@user)
    end
  end
end