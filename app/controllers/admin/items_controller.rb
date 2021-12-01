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

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image_url, :item_picture)
  end

end
