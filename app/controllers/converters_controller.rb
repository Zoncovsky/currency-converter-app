class ConvertersController < ApplicationController
  before_action :set_converter, only: %i[ show edit update destroy ]

  # GET /converters or /converters.json
  def index
    @converters = Converter.all
  end

  # GET /converters/1 or /converters/1.json
  def show
  end

  # GET /converters/new
  def new
    @converter = Converter.new
  end

  # GET /converters/1/edit
  def edit
  end

  # POST /converters or /converters.json
  def create
    @converter = Converter.new(converter_params)

    respond_to do |format|
      if @converter.save
        format.html { redirect_to converter_url(@converter), notice: "Converter was successfully created." }
        format.json { render :show, status: :created, location: @converter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @converter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /converters/1 or /converters/1.json
  def update
    respond_to do |format|
      if @converter.update(converter_params)
        format.html { redirect_to converter_url(@converter), notice: "Converter was successfully updated." }
        format.json { render :show, status: :ok, location: @converter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @converter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /converters/1 or /converters/1.json
  def destroy
    @converter.destroy

    respond_to do |format|
      format.html { redirect_to converters_url, notice: "Converter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_converter
      @converter = Converter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def converter_params
      params.fetch(:converter, {})
    end
end
