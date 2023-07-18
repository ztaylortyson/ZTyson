class LawsuitsController < ApplicationController
  before_action :set_lawsuit, only: %i[ show edit update destroy ]

  # GET /lawsuits or /lawsuits.json
  def index
    @lawsuits = Lawsuit.all
  end

  # GET /lawsuits/1 or /lawsuits/1.json
  def show
  end

  # GET /lawsuits/new
  def new
    @lawsuit = Lawsuit.new
  end

  # GET /lawsuits/1/edit
  def edit
  end

  # POST /lawsuits or /lawsuits.json
  def create
    @lawsuit = Lawsuit.new(lawsuit_params)

    respond_to do |format|
      if @lawsuit.save
        format.html { redirect_to lawsuit_url(@lawsuit), notice: "Lawsuit was successfully created." }
        format.json { render :show, status: :created, location: @lawsuit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lawsuit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lawsuits/1 or /lawsuits/1.json
  def update
    respond_to do |format|
      if @lawsuit.update(lawsuit_params)
        format.html { redirect_to lawsuit_url(@lawsuit), notice: "Lawsuit was successfully updated." }
        format.json { render :show, status: :ok, location: @lawsuit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lawsuit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lawsuits/1 or /lawsuits/1.json
  def destroy
    @lawsuit.destroy

    respond_to do |format|
      format.html { redirect_to lawsuits_url, notice: "Lawsuit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lawsuit
      @lawsuit = Lawsuit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lawsuit_params
      params.require(:lawsuit).permit(:user_id, :active, :case_number, :case_title, :date_filed, :cmc, :judge_name, :judge_dept, :case_status, :last_roa, :plt_caption, :def_caption)
    end
end
