Given("There is a created project with some lists") do
    @filled_list = create(:list_with_tasks)


    @empty_list = build(:unlinked_list)
    @empty_list.project_id = @filled_list.project_id
    @empty_list.save
    @project = Project.find(@filled_list.project_id)
    @project.users << @current_user
    @project.save

  end

  And("I go to the Lists page of my project") do
    #find(:xpath, ".//a[i[contains(@class, 'fa-list')]]").click
    visit "landing"

    within(:xpath, ".//div[contains(., '#{@project.name}') and @class='card']") do
      find(:xpath, ".//a[i[contains(@class, 'fa-list')]]").click
    end
  end

  Then("I should see my empty list") do
    expect(page).to have_content(@empty_list.name)
  end
  
  Then("I will delete the empty list") do
    within(:xpath, ".//tr[contains(., '#{@empty_list.name}')]") do
      find(:xpath, ".//a[contains(@class, 'fa-times')]").click
    end
  end
  
  Then("The empty list should be gone") do
    expect(page).not_to have_content(@empty_list.name)
  end
  
  Then("I want to see a confirmation message") do
    expect(page).to have_content("Lista deletada com sucesso")
  end





  Then("I should see my filled list") do
    expect(page).to have_content(@filled_list.name)
  end
  
  Then("I will try to delete the filled list") do
    within(:xpath, ".//tr[contains(., '#{@filled_list.name}')]") do
      find(:xpath, ".//a[contains(@class, 'fa-times')]").click
    end
  end
  
  Then("The filled list should still be there") do
    expect(page).to have_content(@filled_list.name)
  end
  
  Then("I want to see a failure message warnig about the filled list still being ther") do
    expect(page).to have_content("Lista não pode ser deletada pois contém atividades")
  end