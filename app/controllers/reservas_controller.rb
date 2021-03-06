class ReservasController < ApplicationController
  load_and_authorize_resource
  before_action :set_reserva, only: [:show, :edit, :update, :destroy]

  # GET /reservas
  # GET /reservas.json
  def index
      @reservas = []
      reservas = Reserva.fetch_next_reservas.items
      @minhas_reservas_filter_chckd = params["minhas_reservas"]
      if(@minhas_reservas_filter_chckd.nil?)
        @reservas = reservas
      else
        if(!current_user.nil?)
          reservas.each do |reserva|
            if(reserva.description == "Reserva para: #{current_user[:name]}")
              @reservas.push(reserva)
            end
          end
        end
      end
     
  end

  # GET /reservas/1
  # GET /reservas/1.json
  def show
  end

  # GET /reservas/new
  def new
    @salas = Sala.all
    @professores = User.where({:role => :professor})
  end
  
  # POST /reservas/insert
  def insert
    if(params[:professor].nil?)
      Reserva.make_reservation(params[:datahoraInicio],params[:datahoraFim],params[:sala],current_user.name)
    else
      Reserva.make_reservation(params[:datahoraInicio],params[:datahoraFim],params[:sala],params[:professor])
    end
    redirect_to reservas_path
  end

  # GET /reservas/1/edit
  def edit
  end

  # POST /reservas
  # POST /reservas.json
  def create
    # @reserva = Reserva.new(reserva_params)

    # zrespond_to do |format|
    #   if @reserva.save
    #     format.html { redirect_to @reserva, notice: 'Reserva was successfully created.' }
    #     format.json { render :show, status: :created, location: @reserva }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @reserva.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /reservas/1
  # PATCH/PUT /reservas/1.json
  def update
    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to @reserva, notice: 'Reserva was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserva }
      else
        format.html { render :edit }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.json
  def destroy
    @reserva.destroy
    respond_to do |format|
      format.html { redirect_to reservas_url, notice: 'Reserva was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def google_calendar
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserva_params
      params.require(:datahoraInicio, :datahoraFim, :professor, :sala)
    end
end
