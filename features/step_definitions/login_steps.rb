Given (/^I am on the homepage$/) do
  visit "landing"
end

Given (/^There is an registered user$/) do
  @current_user = User.new(:nome => "user", :email => "user@gmail.com", :password => "123456", :password_confirmation => "123456")
  @current_user.save
end 

When (/^I fill the login form with login information$/) do
  fill_in "Email", :with => "user@gmail.com"
  fill_in "Senha", :with => "123456"
end

When (/^I click the Login button$/) do
  click_button "Login"
end

Then (/^I should see the initial user page$/) do
  expect(page).to have_xpath('.//button[@id="dropdownMenuButton"]')
end
