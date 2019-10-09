Given (/^I have created a project "(.*)" with description "(.*)"$/) do |name, description|
    p = Project.new(:name => "#{name}", :desc => "#{description}")
    p.users << User.first
    p.save
end 