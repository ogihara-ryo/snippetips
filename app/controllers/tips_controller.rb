class TipsController < ApplicationController
  before_action :set_tip, only: %i[show update destroy]

  # GET /tips
  # GET /tips.json
  def index
    @tips = Tip.all
  end

  # GET /tips/1
  # GET /tips/1.json
  def show; end

  # POST /tips
  # POST /tips.json
  def create
    @tip = Tip.new(tip_params)

    if @tip.save
      render :show, status: :created, location: @tip
    else
      render json: @tip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tips/1
  # PATCH/PUT /tips/1.json
  def update
    if @tip.update(tip_params)
      render :show, status: :ok, location: @tip
    else
      render json: @tip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tips/1
  # DELETE /tips/1.json
  def destroy
    @tip.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tip
    @tip = Tip.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tip_params
    params.require(:tip).permit(:body)
  end
end
