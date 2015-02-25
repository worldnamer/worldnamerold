Given(/^I am not logged in$/) do
end

Given(/^a user$/) do
  @user = User.where(email: 'worldnamer@worldnamer.com').first_or_create
  @user.password = 'test'
  @user.password_confirmation = 'test'
  @user.save!
end

Given(/^I am logged in$/) do
  @user = User.where(email: 'worldnamer@worldnamer.com').first_or_create
  @user.password = 'test'
  @user.password_confirmation = 'test'
  @user.save!

  login_as @user
end

Given(/^I have a project$/) do
  @project = Project.create(name: 'Test project', description: 'Test description.')
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
  fill_in 'user[password]', with: 'test'
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
  click_on 'Add'
  fill_in 'snippet[title]', with: 'Wow, You Can Recycle That? - Earth911.com'
  fill_in 'snippet[excerpt]', with: 'A few weeks ago, Earth911 investigated some of the lesser known recyclables. Sure, they don’t receive as much media attention as some of their co-stars like the...'
  fill_in 'snippet[url]', with: 'http://example.com'
  click_on 'Create'
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
  expect(Project.count).to be 1
end

Then(/^I should see my project in the list$/) do
  expect(page).to have_content @project.name
  expect(page).to have_content @project.description
end

Then(/^I should have a snippet$/) do
  expect(Snippet.count).to be 1
end
