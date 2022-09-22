class Admin::BrandsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @brands = Brand.all
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to admin_brands_path, notice: "#{@brand.name}を作成しました"
    else
      @brands = Brand.all
      render :index
    end
  end

  def destroy
    brand = Brand.find(params[:id])
    brand.destroy
    redirect_to admin_brands_path, notice: "#{brand.name}を消しました"
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end