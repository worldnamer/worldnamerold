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
  @project = Project.create(name: 'Test project')
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
end