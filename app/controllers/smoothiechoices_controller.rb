class SmoothiechoicesController < ApplicationController
  before_action :set_smoothiechoice, only: %i[ show edit update destroy ]
  before_action :authenticated

  # GET /smoothiechoices or /smoothiechoices.json
  def index
    @smoothiechoices = Smoothiechoice.all
  end

  # GET /smoothiechoices/1 or /smoothiechoices/1.json
  def show
  end

  # GET /smoothiechoices/new
  def new
    @smoothiechoice = Smoothiechoice.new
  end

  # GET /smoothiechoices/1/edit
  def edit
  end

  # POST /smoothiechoices or /smoothiechoices.json
  def create
    @smoothiechoice = Smoothiechoice.new(smoothiechoice_params)

    respond_to do |format|
      if @smoothiechoice.save
        format.html { redirect_to @smoothiechoice, notice: "Smoothiechoice was successfully created." }
        format.json { render :show, status: :created, location: @smoothiechoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @smoothiechoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smoothiechoices/1 or /smoothiechoices/1.json
  def update
    respond_to do |format|
      if @smoothiechoice.update(smoothiechoice_params)
        format.html { redirect_to @smoothiechoice, notice: "Smoothiechoice was successfully updated." }
        format.json { render :show, status: :ok, location: @smoothiechoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @smoothiechoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smoothiechoices/1 or /smoothiechoices/1.json
  def destroy
    @smoothiechoice.destroy
    respond_to do |format|
      format.html { redirect_to smoothiechoices_url, notice: "Smoothiechoice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smoothiechoice
      @smoothiechoice = Smoothiechoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def smoothiechoice_params
      params.require(:smoothiechoice).permit(:name, :description, :photo)
    end
  
  def authenticated
    if session[:username].present?
      return true
    else
      redirect_to(welcome_index_path, alert: "Session expired, please sign in.")
      return false
    end
  end
end
