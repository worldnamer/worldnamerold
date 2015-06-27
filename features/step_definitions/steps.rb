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
  @todos = @project.sections.create(name: 'Todos List', section_type: 'todos')
  @links = @project.sections.create(name: 'Links', section_type: 'links')
end

Given(/^I have a snippet$/) do
  @links.links.create(title: 'Test title', excerpt: 'Test excerpt', url: 'www.example.com')
end

Given(/^another user has a project$/) do
  create(:user).projects.create(name: 'test', description: 'test')
end

Given(/^I have a goal$/) do
  @goal = @user.goals.create(description: 'This is a goal.', term: Term.first, life_area: LifeArea.first)
  expect(@goal).to be_valid
end

Given(/^another user has a goal$/) do
  create(:user).goals.create(description: 'test')
end

Given(/^I have a project with a todo$/) do
  step "I have a project"

  @todo = @todos.todos.create(description: "complete this test")
end

Given(/^I have the following goals$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
    @user.goals.create(description: hash[:description], term: Term.first, life_area: LifeArea.first)
  end
end

Given(/^I have a link$/) do
  @link = @user.links.create(title: 'title', excerpt: 'excerpt', url: 'http://example.com')
end

Given(/^I have a section in that project$/) do
  @section = @project.sections.create(name: 'sample section', section_type: 'todos')
end

When(/^I delete that link from my media list$/) do
  visit media_path

  find(:css, 'a[name=delete-link]').click()
end

When(/^I delete that project$/) do
  visit projects_path
  find(:css, '.project a[data-method=delete]').click
  expect(page).to_not have_content @project.name
end

When(/^I move the top goal to the bottom$/) do
  @goal = @user.goals.first

  visit life_plan_path
  page.execute_script %Q{
    $('.goal:first').simulateDragSortable({ move: 1, handle: '.fa-sort' });
  }

  # This does two things. First it verifies that the goal was moved in the HTML. Second, it forces us to flush the AJAX call for the update.
  expect(all(:css, '.goal').last).to have_text @goal.description
end

When(/^I mark that todo complete$/) do
  visit project_path(@project)

  find(:css, "#todo_#{@todo.id}").click
end

When(/^I view my goals$/) do
  visit life_plan_path
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
  expect(page).to have_content 'Title'
  fill_in 'link[title]', with: 'Wow, You Can Recycle That? - Earth911.com'
  fill_in 'link[excerpt]', with: 'A few weeks ago, Earth911 investigated some of the lesser known recyclables. Sure, they don’t receive as much media attention as some of their co-stars like the...'
  fill_in 'link[url]', with: 'http://example.com'
  click_on 'Create'
end

When(/^I delete the snippet$/) do
  visit project_path(@project)
  find(:css, '.link a[name=delete-link]').click()
end

When(/^I set a new goal$/) do
  visit life_plan_path
  click_link 'Add'
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

When(/^I delete that goal$/) do
  visit life_plan_path
  find(:css, "a#goal_#{@goal.id}.delete-goal-link").click
end

When(/^I update the goal description to '(.*)'$/) do |description|
  bip_text @goal, :description, description
  @goal.description = description
end

When(/^I complete my goal$/) do
  page.execute_script %Q{
    $('.complete-goal-link').click();
  }
end

When(/^I add a link to the media list$/) do
  visit media_path

  within :css, '#add-link-link' do
    click_on 'Add'
  end

  @title = 'Wow, You Can Recycle That? - Earth911.com'
  fill_in 'link[title]', with: @title
  fill_in 'link[excerpt]', with: 'A few weeks ago, Earth911 investigated some of the lesser known recyclables. Sure, they don’t receive as much media attention as some of their co-stars like the...'
  fill_in 'link[url]', with: 'http://example.com'
  click_on 'Create'
end

When(/^I export data$/) do
  begin
    visit export_path
  rescue Exception => e
    @exception = e
    raise e unless e.message.start_with?('No route matches')
  end
end

When(/^I create a section in that project$/) do
  visit project_path(@project)
  within :css, '#add-section-link' do
    click_on 'Add Section'
  end

  @name = 'Todo List'
  @type = 'todos'
  fill_in 'section[name]', with: @name
  select 'ToDo List', from: 'section[section_type]'
  click_on 'Create'
end

When(/^I delete that section$/) do
  visit project_path(@project)
  find(:css, "#section#{@section.id} a[data-method=delete]").click
end

When(/^I update my links section to be named '(.*)'$/) do |name|
  @name = name

  visit project_path(@project)
  bip_text @links, :name, @name
end

Then(/^that section should be renamed$/) do
  expect(page).to have_content(@links.name)
  expect(@links.reload.name).to eq(@name)
end

Then(/^I should have no sections in that project$/) do
  expect(page).to_not have_content @section.name
end

Then(/^I should have that section$/) do
  expect(page).to have_content @name

  expect(Section.first.section_type).to eq(@type)
end

Then(/^I should have no links$/) do
  expect(Link.count).to be 0
end

Then(/^I should get an error$/) do
  @exception.present?
end

Then(/^I should get a file$/) do
  expect(page.response_headers['Content-Type']).to eq('application/octet-stream')
end

Then(/^I should have that link in my media list$/) do
  expect(page).to have_content(@title)
end

Then(/^my goal should be completed$/) do
  expect(@goal.reload).to be_completed
end

Then(/^my goal should not be visible on the goals page$/) do
  visit life_plan_path
  expect(page).to_not have_content(@goal.description)
end

Then(/^my goal should be updated$/) do
  visit life_plan_path

  expect(page).to have_content @goal.description
end

Then(/^I should have no projects$/) do
  visit projects_path
  expect(all(:css, '.project').count).to eq(1) # JWLL: The add link looks like a project
end

Then(/^it should reorder that goal as last$/) do
  expect(@user.reload.goals.last).to eq(@goal.reload)
end

Then(/^I should have no goals$/) do
  expect(@user.reload.goals.count).to eq(0)
end

Then(/^my todo should be done$/) do
  visit project_path(@project)
  
  expect(@todo.reload).to be_completed
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
  visit life_plan_path
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
  expect(Link.count).to be 1
end

Then(/^I should have no snippets$/) do
  expect(Link.count).to be 0
end
