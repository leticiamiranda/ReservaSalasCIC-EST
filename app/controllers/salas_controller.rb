class Dashboard::SalasController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @sala = Sala.find(id) # look up movie by unique ID
    # will render app/views/salas/show.<extension> by default
  end

  def index
    if @salas
      @salas = Sala.all
     end 
  end

  def new
    # default: render 'new' template
  end

  def create
    params.permit!
    @sala = Sala.create!(params[:sala])
    flash[:notice] = "#{@sala.nome} foi criada com sucesso."
    redirect_to salas_path
  end

  def edit
    @sala = Sala.find params[:id]
  end

  def update
    params.permit!
    @sala = Sala.find params[:id]
    @sala.update_attributes!(params[:sala])
    flash[:notice] = "#{@sala.nome} foi atualizado com sucesso."
    redirect_to sala_path(@sala)
  end

  def destroy
    @sala = Sala.find(params[:id])
    @sala.destroy
    flash[:notice] = "Sala '#{@sala.nome}' deletada."
    redirect_to salas_path
  end

end
