class CafeController < ApplicationController
  #--------------------------------------------------------------
  # IMPORTANT!! REMOVE FOR PRODUCTION!!!!
  skip_before_action :verify_authenticity_token
  #--------------------------------------------------------------

  before_action :set_item, only: %i[show update destroy edit]

  def index
    @menu = MenuItem.order(:name)
    @currency_symbol = '$'
  end

  def about
    render json: MenuItem.all
  end

  def create
    @item = MenuItem.create(item_params)
    redirect_to menu_item_path(@item)
  end

  def show; end

  def update
    @item.update(item_params)
    redirect_to menu_item_path(@item)
  end

  def destroy
    MenuItem.find(params[:id]).destroy
    redirect_to root_path
  end

  def set_item
    @item = MenuItem.find(params[:id])
  end

  def new
    @item = MenuItem.new
  end

  def edit
  end

  def item_params
    params.require(:menu_item).permit(:name, :price, :qty)
  end
end
