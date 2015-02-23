Given(/^I am not logged in$/) do
end

When(/^I view the home page$/) do
  visit root_path
end

Then(/^I should see the splash page$/) do
  expect(page).to have_content 'worldnamer'
end
