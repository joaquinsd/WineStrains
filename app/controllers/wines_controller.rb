class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]
  before_action :check_total, only: [:create]

  # GET /wines
  # GET /wines.json
  def index
    @wines = Wine.all
  end

  # GET /wines/1
  # GET /wines/1.json
  def show
  end

  # GET /wines/new
  def new
    @wine = Wine.new
    @strains = Strain.all
  end

  # GET /wines/1/edit
  def edit
    @strains = Strain.all
  end

  # POST /wines
  # POST /wines.json
  def create
    @wine = Wine.new(wine_params)
    @strains = Strain.all

    respond_to do |format|
      if @wine.save
        format.html { redirect_to @wine, notice: 'Wine was successfully created.' }
        format.json { render :show, status: :created, location: @wine }
      else
        format.html { render :new }
        format.json { render json: @wine.errors, status: :unprocessable_entity, notice: 'An error ocurred!' }
      end
    end
  end

  # PATCH/PUT /wines/1
  # PATCH/PUT /wines/1.json
  def update
    respond_to do |format|

      if @wine.update(wine_params)
        format.html { redirect_to @wine, notice: 'Wine was successfully updated.' }
        format.json { render :show, status: :ok, location: @wine }
      else
        format.html { render :edit }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1
  # DELETE /wines/1.json
  def destroy
    @wine.destroy
    respond_to do |format|
      format.html { redirect_to wines_url, notice: 'Wine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wine_params
      params.require(:wine).permit(:name, assemblies_attributes: [:strain_id, :percentage])
    end

    def check_total
      sum = 0
      if !params[:wine][:assemblies_attributes].nil?
        params[:wine][:assemblies_attributes].each_value do |strain|
          sum += (strain[:percentage]).to_i
        end
        if sum > 100
        redirect_to new_wine_path, alert: 'Strain percentages sum is greater than 100'
        elsif sum < 100
        redirect_to new_wine_path, alert: 'Strain percentages must sum 100'
        end
      else
        redirect_to new_wine_path, alert: 'You must add a strain in order to make wine'
      end
      
    end
end
