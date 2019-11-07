When("I click on the Delete button") do
  @actual_task_count = Task.count
  find("a[class='btn btn-danger fa fa-times']").click
end

Then("the number of tasks should decrease by one") do
  Task.count.should == @actual_task_count -1
end

Then("the task should not be found on the page") do
  page.has_no_selector?("a[id='Task teste_id']")
end
