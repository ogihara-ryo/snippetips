class RelationshipsController < ApplicationController
  before_action :set_relationship, only: %i[show update destroy]

  # GET /relationships
  # GET /relationships.json
  def index
    @relationships = Relationship.all
  end

  # GET /relationships/1
  # GET /relationships/1.json
  def show; end

  # POST /relationships
  # POST /relationships.json
  def create
    @relationship = Relationship.new(relationship_params)

    if @relationship.save
      render :show, status: :created, location: @relationship
    else
      render json: @relationship.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /relationships/1
  # PATCH/PUT /relationships/1.json
  def update
    if @relationship.update(relationship_params)
      render :show, status: :ok, location: @relationship
    else
      render json: @relationship.errors, status: :unprocessable_entity
    end
  end

  # DELETE /relationships/1
  # DELETE /relationships/1.json
  def destroy
    @relationship.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_relationship
    @relationship = Relationship.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def relationship_params
    params.require(:relationship).permit(:follower_id, :followed_id)
  end
end
