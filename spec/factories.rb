FactoryBot.define do
  
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

    factory :invalid_project, class: Project do
      desc {"a"}
    end

    factory :list, class: List do

      name {"To Do"}
      desc {"A ser Feito"}
      project_id {create(:project).id}
    end
  
    factory :invalid_list, class: List do
      desc {"Pendente a ser feito"}
    end
  end