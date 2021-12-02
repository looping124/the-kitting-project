class Admin::ItemsController < Admin::BoardController
  #Callbacks
  before_action :authenticate_user!
  before_action :is_admin?

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    puts @item.errors.inspect
    puts @item.valid?   
    if @item.save
      puts "#" * 60
      flash[:success] = "L'item a été créé avec succès 😎"
      redirect_to(admin_item_path(@item))
    else
      puts "$" * 60
      flash.now[:warning] = @item.errors.full_messages
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      flash[:success] = "L'item a été modifié avec succès 👌"
      redirect_to items_path
    else
      flash.now[:warning] = @item.errors.full_messages
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "L'item a été supprimé avec succès 👌"
    redirect_to items_path
  end

  def mask
    puts "Vendable ? => #{Item.find(params[:item]).sellable}"
    puts params
    Item.find(params[:item]).update(sellable: params[:unmask])
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image_url, :item_picture)
  end

end
