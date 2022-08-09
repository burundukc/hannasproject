class BrandsController < ApplicationController
  before_action :set_brand, only: %i[show edit update destroy]
  # before_filter :authenticate_user!

  # GET /brands or /brands.json
  def index
    @brands = Brand.all
  end

  # GET /brands/1 or /brands/1.json
  def show; end

  # GET /brands/new
  def new
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit; end

  # POST /brands or /brands.json
  def create
    @brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to brand_url(@brand), notice: 'Поставщик успешно создан!' }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brands/1 or /brands/1.json
  def update
    respond_to do |format|
      if @brand.update(brand_params)
        format.html { redirect_to brand_url(@brand), notice: 'Данные поставщика успешно обновлены.' }
        format.json { render :show, status: :ok, location: @brand }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1 or /brands/1.json
  def destroy
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to brands_url, notice: 'Поставщик успешно удален!' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_brand
    @brand = Brand.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def brand_params
    params.require(:brand).permit(:title, :bytitle, :description, :img, :link, :address)
  end
end
