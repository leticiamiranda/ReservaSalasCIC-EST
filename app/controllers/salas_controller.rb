class SalasController < ApplicationController
  load_and_authorize_resource
  before_action :set_sala, only: [:show, :edit, :update, :destroy]

  # GET /salas
  # GET /salas.json
  def index
    @salas = Sala.all
  end

  # GET /salas/1
  # GET /salas/1.json
  def show
  end

  # GET /salas/new
  def new
    @sala = Sala.new
  end

  # GET /salas/1/edit
  def edit
  end

  # POST /salas
  # POST /salas.json
  def create

    @sala_recuperada = Sala.find_by(params[:nome])

    if @sala_recuperada
      respond_to do |format|
        format.html { redirect_to salas_url, alert: 'Sala não cadastrada. Existe outra sala com mesmo nome.' }
        format.json { head :no_content }
      end
    else  
      @sala = Sala.new(sala_params)

      respond_to do |format|
        if @sala.save
          format.html { redirect_to @sala, notice: 'Sala cadastrada com sucesso!' }
          format.json { render :show, status: :created, location: @sala }
        else
          format.html { render :new }
          format.json { render json: @sala.errors, status: :unprocessable_entity }
        end
      end
    end  
  end

  # PATCH/PUT /salas/1
  # PATCH/PUT /salas/1.json
  def update
    respond_to do |format|
      if @sala.update(sala_params)
        format.html { redirect_to @sala, notice: 'Sala atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @sala }
      else
        format.html { render :edit }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salas/1
  # DELETE /salas/1.json
  def destroy
    @recursos = Recurso.where(sala_id: @sala.id)
    @recursos.each do |recurso|
      recurso.destroy
    end
    @sala.destroy
    respond_to do |format|
      format.html { redirect_to salas_url, notice: 'Sala removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sala
      @sala = Sala.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sala_params
      params.require(:sala).permit(:nome, :qtd_lugares, :disponivel)
    end
end