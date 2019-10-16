Given (/^I am on the page of my created project$/) do
    # Verificar se dá pra usar helper methods por boas praticas
    steps %Q{
        Given I login successfully
        And I have created a project "Projeto Teste" with description "Projeto para fins de teste"
        When I go to the homepage
      }
end 

  When("I go to the Edit Lists page") do
    find(:xpath, ".//a[i[contains(@class, 'fa-list')]]").click
  end

  Given("My project have X lists") do
    @lists_count = Project.first.lists.count
  end
  
  When("I should fill the form with name {string} and description {string}") do |name, description|
    puts URI.parse(current_url).path
    fill_in "list_name", :with => name
    fill_in "list_desc", :with => description
  end
  
  Then("I should click the Criar Lista button") do
    click_button "Criar Lista"
  end
  
  Then("I should see a row on the Lists table containing {string} and {string}") do |name, description|
    expect(page).to have_content("#{name}")
    expect(page).to have_content("#{description}")
  end
  
  Then("My project should have X+1 lists") do
    Project.first.lists.count.should == @lists_count + 1
  end