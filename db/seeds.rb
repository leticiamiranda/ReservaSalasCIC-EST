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
		{:nome => "Sala de Estudos (Doutorado)", :qtd_lugares => "10"},
		{:nome => "Sala de Reuniao 1", :qtd_lugares => "10"},
		{:nome => "Sala de Reuniao 2", :qtd_lugares => "10"},
		{:nome => "Sala de Reuniao 3", :qtd_lugares => "10"},
		{:nome => "Sala de Reuniao 4", :qtd_lugares => "10"},
		{:nome => "Sala de Reuniao 5", :qtd_lugares => "10"},
		{:nome => "Sala de Reuniao 6", :qtd_lugares => "10"},
		{:nome => "Sala Multiuso", :qtd_lugares => "10"},
		{:nome => "Sala de Pesquisadores 1", :qtd_lugares => "10"},
		{:nome => "Sala de Pesquisadores 2", :qtd_lugares => "10"},
		{:nome => "Sala de Professores Substitutos 1", :qtd_lugares => "3"},
		{:nome => "Sala de Professores Substitutos 2", :qtd_lugares => "3"},
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


recursos = [
		{:sala_id => "1", :nome => "Cadeira", :qtd => "20"},
		{:sala_id => "2", :nome => "Cadeira", :qtd => "20"},
		{:sala_id => "3", :nome => "Cadeira", :qtd => "20"},
		{:sala_id => "4", :nome => "Cadeira", :qtd => "20"},
		]

recursos.each do |recurso|
	Recurso.create!(recurso)
end
