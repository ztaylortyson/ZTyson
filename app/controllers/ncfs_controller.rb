class NcfsController < ApplicationController
  before_action :set_ncf, only: %i[ show edit update destroy ]

  # GET /ncfs or /ncfs.json
  def index
    @ncfs = Ncf.all
  end

  # GET /ncfs/1 or /ncfs/1.json
  def show
  end

  # GET /ncfs/new
  def new
    @ncf = Ncf.new
  end

  # GET /ncfs/1/edit
  def edit
  end

  # POST /ncfs or /ncfs.json
  def create
    @ncf = Ncf.new(ncf_params)

    respond_to do |format|
      if @ncf.save
        format.html { redirect_to ncf_url(@ncf), notice: "Ncf was successfully created." }
        format.json { render :show, status: :created, location: @ncf }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ncf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ncfs/1 or /ncfs/1.json
  def update
    respond_to do |format|
      if @ncf.update(ncf_params)
        format.html { redirect_to ncf_url(@ncf), notice: "Ncf was successfully updated." }
        format.json { render :show, status: :ok, location: @ncf }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ncf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ncfs/1 or /ncfs/1.json
  def destroy
    @ncf.destroy

    respond_to do |format|
      format.html { redirect_to ncfs_url, notice: "Ncf was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ncf
      @ncf = Ncf.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ncf_params
      params.require(:ncf).permit(:name)
    end
end
