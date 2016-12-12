Given (/^the following recursos exist/) do |recursos_table|
  recursos_table.hashes.each do |recurso|
    Recurso.create!(recurso)
  end
end

Then(/^I should see all the recursos/) do 
  have_content ('Lab. de Estudos e Projetos')
  have_content ('Sala de Estudos (Doutorado)')
  have_content ('Sala de Reuniao 1')
  have_content ('Sala de Reuniao 2')
  

  have_content ('Cadeira')
  have_content ('20')
  
end