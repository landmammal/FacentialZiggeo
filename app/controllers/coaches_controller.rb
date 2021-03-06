class CoachesController < ApplicationController
  # before_filter :authorize, only: [:show]
  before_action :set_coach, only: [:show, :edit, :update, :destroy, :token]
  include SessionsHelper
  # GET /coaches
  # GET /coaches.json
  def token
    token = token_params[:field]
    @coach.field = token
    binding.pry

    if @coach.save!
      # binding.pry
    render json: @coach.field, status: :ok
  end
  end


  def index
  end

  # GET /coaches/1
  # GET /coaches/1.json
  def show
  end

  # GET /coaches/new
  def new
    @coach = Coach.new
  end

  # GET /coaches/1/edit
  def edit
  end

  # POST /coaches
  # POST /coaches.json
  def create
    @coach = Coach.new(coach_params)

      if @coach.save
        session[:coach_id] = @coach.id
        redirect_to @coach
      else
        redirect_to '/signup'
        # format.html { render :new }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end

  end

  # PATCH/PUT /coaches/1
  # PATCH/PUT /coaches/1.json
  def update
    respond_to do |format|
      if @coach.update(coach_params)
        format.html { redirect_to @coach, notice: 'Coach was successfully updated.' }
        format.json { render :show, status: :ok, location: @coach }
      else
        format.html { render :edit }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coaches/1
  # DELETE /coaches/1.json
  def destroy
    @coach.destroy
    respond_to do |format|
      format.html { redirect_to coaches_url, notice: 'Coach was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coach
      @coach = Coach.find(params[:id])
    end

    def token_params
      params.require(:coach).permit(:field)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def coach_params
      params.require(:coach).permit(:name, :email, :avatar, :password, :password_confirmation, :token)
    end
end
