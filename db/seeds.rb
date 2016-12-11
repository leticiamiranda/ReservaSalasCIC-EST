# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

salas = [
		{:nome => "Lab. de Estudos e Projetos", :qtd_lugares => "10"},
		{:nome => "Salas de Estudos (Doudorado)", :qtd_lugares => "10"},
		{:nome => "Salas de Reuniao 1", :qtd_lugares => "10"},
		{:nome => "Salas de Reuniao 2", :qtd_lugares => "10"},
		{:nome => "Salas de Reuniao 3", :qtd_lugares => "10"},
		{:nome => "Salas de Reuniao 4", :qtd_lugares => "10"},
		{:nome => "Salas de Reuniao 5", :qtd_lugares => "10"},
		{:nome => "Salas de Reuniao 6", :qtd_lugares => "10"},
		{:nome => "Salas Multiuso", :qtd_lugares => "10"},
		{:nome => "Salas de Pesquisadores 1", :qtd_lugares => "10"},
		{:nome => "Salas de Pesquisadores 2", :qtd_lugares => "10"},
		{:nome => "Salas de Professores Substitutos 1", :qtd_lugares => "3"},
		{:nome => "Salas de Professores Substitutos 2", :qtd_lugares => "3"},
		{:nome => "LARA", :qtd_lugares => "10"},
		{:nome => "Lab. Proj. Especiais", :qtd_lugares => "10"},
		{:nome => "Lab. Pos", :qtd_lugares => "10"},
		{:nome => "Auditorio", :qtd_lugares => "100"},
		{:nome => "LISA", :qtd_lugares => "10"},
		{:nome => "COMNET", :qtd_lugares => "10"},
		{:nome => "LAICO", :qtd_lugares => "10"},
		{:nome => "LES", :qtd_lugares => "10"},
		{:nome => "LABID", :qtd_lugares => "10"},
		{:nome => "TRANS LAB", :qtd_lugares => "10"},
		{:nome => "LAFORCE", :qtd_lugares => "10"},
		]

salas.each do |sala|
	Sala.create!(sala)
end

