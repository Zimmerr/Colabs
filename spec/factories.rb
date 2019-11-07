FactoryBot.define do
  factory :post do
    
  end

  
    factory :project_with_list, class: Project do
      after :create do |project|
        create_list :list, 1, project_id: project.id   # has_many
      end

      name {"Projetasso"}
      desc {"Sim"}
    end

    factory :project, class: Project do
      name {"Projetasso"}
      desc {"Sim"}
    end

    factory :user, class: User do
      nome {"Zezinho"}
      email {"zezinho@gmail.com"}
      password {"123456"}
    end

    factory :invalid_project, class: Project do
      desc {"a"}
    end

    factory :list, class: List do

      name {"To Do"}
      desc {"A ser Feito"}
      project_id {create(:project).id}
    end
    
    factory :list_with_tasks, class: List do
      after :create do |list|
        create_list :task, 1, project_id: list.project_id, list_id: list.id   # has_many
      end
      name {"xd"}
      desc {"aaaa"}
      project_id {create(:project).id}
    end
  
    factory :invalid_list, class: List do
      desc {"Pendente a ser feito"}
      project_id {create(:project).id}
    end

    factory :unlinked_list, class: List do 
      name {"Doing"}
      desc {"Sendo Feito"}
    end

    factory :task, class: Task do 
      name {"Começar"}
      desc {"Começar a fazer as coisas"}
      project_id {create(:project).id}
      list_id {create(:list).id}
    end
  end