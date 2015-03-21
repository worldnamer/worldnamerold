Given(/^I am not logged in$/) do
end

Given(/^a user$/) do
  @user = create(:worldnamer)
end

Given(/^I am logged in$/) do
  @user = create(:worldnamer)

  login_as @user
end

Given(/^I have a project$/) do
  @project = @user.projects.create(name: 'Test project', description: 'Test description.')
end

Given(/^I have a snippet$/) do
  @project.snippets.create(title: 'Test title', excerpt: 'Test excerpt', url: 'www.example.com')
end

Given(/^another user has a project$/) do
  create(:user).projects.create(name: 'test', description: 'test')
end

Given(/^I have a goal$/) do
  @goal = @user.goals.create(description: 'This is a goal.')
end

Given(/^another user has a goal$/) do
  create(:user).goals.create(description: 'test')
end

When(/^I view my goals$/) do
  visit goals_path
end

When(/^I view the home page$/) do
  visit root_path
end

When(/^I log in$/) do
  visit root_path

  page.execute_script %Q{
    $('#nav').show();
    $('button').show();
  }

  click_on 'Log In'
  fill_in 'user[password]', with: 'password'
  click_on 'Sign In'
end

When(/^I fail to log in$/) do
  visit root_path

  page.execute_script %Q{
    $('#nav').show();
    $('button').show();
  }

  click_on 'Log In'
  fill_in 'user[password]', with: 'bogus'
  click_on 'Sign In'
end

When(/^I create a project$/) do
  visit main_path
  click_on 'Projects'
  click_on 'Create'
  fill_in 'project[name]', with: 'Test Project'
  click_on 'Create'
end

When(/^I view my projects$/) do
  visit projects_path
end

When(/^I create a snippet$/) do
  visit project_path(@project)
  within :css, '#add-link-link' do
    click_on 'Add'
  end
  fill_in 'snippet[title]', with: 'Wow, You Can Recycle That? - Earth911.com'
  fill_in 'snippet[excerpt]', with: 'A few weeks ago, Earth911 investigated some of the lesser known recyclables. Sure, they don’t receive as much media attention as some of their co-stars like the...'
  fill_in 'snippet[url]', with: 'http://example.com'
  click_on 'Create'
end

When(/^I delete the snippet$/) do
  visit project_path(@project)
  find(:css, 'a[name=delete-link]').click()
end

When(/^I set a new goal$/) do
  visit goals_path
  click_on 'Add'
  @description = 'I want to go visit my friends who can\'t travel without worring about my job.'
  fill_in 'goal[description]', with: @description
  click_on 'Create'
end

When(/^I view my project$/) do
  visit project_path(@project)
end

When(/^I update its name to '(.*)'$/) do |name|
  bip_text @project, :name, name
  @project.name = name
end

When(/^I update its description to '(.*)'$/) do |description|
  bip_text @project, :description, description
  @project.description = description
end

When(/^I add a todo to my project$/) do
  visit project_path(@project)
  within :css, '#add-todo-link' do
    click_on 'Add'
  end

  @description = 'Pick up milk.'
  fill_in 'todo[description]', with: @description
  click_on 'Create'
end

Then(/^I should have that todo$/) do
  visit project_path(@project)

  expect(page).to have_content @description
end

Then(/^my project should be updated$/) do
  visit project_path(@project)

  expect(page).to have_content @project.name
  expect(page).to have_content @project.description
end

Then(/^I should see one goal in the list$/) do
  expect(all(:css, '.goal').count).to be 1
end

Then(/^I should see my goal in the list$/) do
  expect(page).to have_content @goal.description
end

Then(/^I should see one project in the list$/) do
  visit projects_path
  expect(all(:css, '.project').count).to be 2 # 1 for the project, 1 for the add link
end

Then(/^I should have a goal$/) do
  visit goals_path
  expect(page).to have_content @description
end

Then(/^I should see the splash page$/) do
  expect(page).to have_content 'worldnamer'
end

Then(/^I should be logged in$/) do
  expect(page).to have_content 'Signed in'
end

Then(/^I should not be logged in$/) do
  expect(page).to have_content 'Invalid email or password'
end

Then(/^I should have a project$/) do
  expect(@user.projects.count).to be 1
end

Then(/^I should see my project in the list$/) do
  expect(page).to have_content @project.name
  expect(page).to have_content @project.description
end

Then(/^I should have a snippet$/) do
  expect(Snippet.count).to be 1
end

Then(/^I should have no snippets$/) do
  expect(Snippet.count).to be 0
end
