class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:search].present?
      sql_query = <<~SQL
        items.name @@ :query
      SQL
      @items = Item.where(sql_query, query: "%#{params[:search][:query]}%")
      if @items.empty?
        @items = item.where(category: params[:search][:query])
      end
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    # @item_not = item.where.not(user: current_user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category, :description, photos: [])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
