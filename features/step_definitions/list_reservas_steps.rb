Given (/I am registered as a user/) do 
    @user = User.create({
        :name => 'teste',
        :email => 'teste@test.com',
        :password => '123456',
        :password_confirmation => '123456',
        :confirmed_at => Time.now
    })
end

Given (/My role is (.+)$/) do |my_role|
    @user ||= User.find_by name: 'teste'
    if(my_role == 'teacher')
        @user.professor!
    elsif(my_role == 'secretary')
        @user.secretaria!
    elsif (my_role == 'admin')
        @user.admin!
    else
        @user.usuario!
    end
end

When (/I visit (.+) page$/) do |webpage|
    visit '/' + webpage
end

Then (/I should see a row in reservas table for each reserva made on google calendar API/) do
    reservas = Reserva.fetch_next_reservas.items
    expect(reservas.count).to be == page.all('tr').count
    reservas.each do |reserva|
        expect(page).to have_content(reserva.location) 
        descricao = /Reserva para: (.*)$/.match(reserva.description)
        if(!descricao.nil?)
            expect(page).to have_content(descricao[1])
        end
        expect(page).to have_content("#{reserva.start.date_time.strftime("%d/%m/%Y às %H:%M")} a #{reserva.end.date_time.strftime("%d/%m/%Y às %H:%M")}")
    end
end

