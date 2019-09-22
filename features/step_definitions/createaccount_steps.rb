Given /^I am on the cadastrar_usuario page$/ do
  visit "cadastrar_usuario"
end

When /^I fill the new user form with (.*) as name and (.*) as email and (.*) as password and (.*) as confirmation$/ do |name, email, password, confirmation|
  @actual_count = User.count
  fill_in "user_nome", :with => name
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  fill_in "user_password_confirmation", :with => confirmation
end

When /^click on the 'Entrar no Colabs!' button$/ do
  click_button "Entrar no Colabs!"
end

Then /^the number of existent users shoulbe be increased by one$/ do
  User.count.should == @actual_count + 1
end

Then /^I should be sent back to the homepage$/ do
  expect(page).to have_xpath('.//div[@id="login-box"]')
end
