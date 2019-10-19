# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
projects = Project.create([{ name: 'Projeto Teste', desc: 'teste' }, { name: 'P2' }])
pj = ProjectUser.create([{ project_id: 0, user_id: 0 }])
#   Character.create(name: 'Luke', movie: movies.first)
