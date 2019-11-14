  Given("There is a created list") do
    @filled_list = create(:list)
    @original_name = @filled_list.name
    @original_desc = @filled_list.desc

    @project = Project.find(@filled_list.project_id)
    @project.users << @current_user
    @project.save
  end

  Then("I should see my list") do
    expect(page).to have_content(@original_name)
  end
  
  Then("I should click the edit button") do
    within(:xpath, ".//tr[contains(., '#{@original_name}')]") do
      find(:xpath, ".//a[contains(@class, 'fa-edit')]").click
    end
  end
  
  When("I will try a new name and description") do
    fill_in "list_name", :with => "nome_novo"
    fill_in "list_desc", :with => "description"
  end

  Then("I should click the save button") do
    click_button "Atualizar Lista"
  end

  Then("I want to see a Updated message") do
    expect(page).to have_content("Lista atualizada com sucesso!")
  end

  Then("I should see my edited list") do
    expect(page).to have_content("nome_novo")
  end




  When("I will try a invalid name and description") do
    fill_in "list_name", :with => ""
    fill_in "list_desc", :with => ""
  end

  Then("I want to see a not Updated message") do
    expect(page).to have_content("Lista não foi atualizada com sucesso. Preencha os campos corretamente.")
  end

  Then("I should see my original list without changes") do
    expect(page).to have_content(@original_name)
  end

  