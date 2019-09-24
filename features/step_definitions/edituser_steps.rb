Given (/^I am on the Edit User page$/) do
    visit editar_usuario_url
  end
  
  When (/^I fill the edit user form with (.*) as name and (.*) as email and (.*) as password and (.*) as confirmation$/) do |name, email, password, confirmation|
    @actual_count = User.count
    fill_in "user_nome", :with => name
    fill_in "user_email", :with => email
    fill_in "user_password", :with => password
    fill_in "user_password_confirmation", :with => confirmation
  end
  
  When (/^click on the 'Atualizar' button$/) do
    click_button "Atualizar"
  end
  
  Then (/^the number of existent users shoulbe be the same$/) do
    User.count.should == @actual_count
  end
  
  Then (/^I should see a confirmation message$/) do
    expect(page).to have_content("Usuário atualizado com sucesso!")
  end
  