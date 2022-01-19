class SpCartsController < ApplicationController
  before_action :set_sp_cart, only: %i[ show edit update destroy ]

  # GET /sp_carts or /sp_carts.json
  def index
    @sp_carts = SpCart.all
  end

  # GET /sp_carts/1 or /sp_carts/1.json
  def show
  end

  # GET /sp_carts/new
  def new
    @sp_cart = SpCart.new
  end

  # GET /sp_carts/1/edit
  def edit
  end

  # POST /sp_carts or /sp_carts.json
  def create
    @sp_cart = SpCart.new(sp_cart_params)

    respond_to do |format|
      if @sp_cart.save
        format.html { redirect_to sp_cart_url(@sp_cart), notice: "Sp cart was successfully created." }
        format.json { render :show, status: :created, location: @sp_cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sp_cart.errors, status: :unprocessable_entity }
      end
    end
  end
  #
  def create
    chosen_product = Product.find(params[:product_id])
    if sp_cart.product.include?(chosen_product)
        @sp_cart = sp_cart.order_details.find_by(:product_id => chosen_product)
        @sp_cart.quantity += 1
    else
        @sp_cart = sp_cart.new 
        @sp_cart.cart = current_cart
        @sp_cart.product = chosen_product
        @sp_cart.quantity = 1
    end     
    @order_detail.price = @order_detail.quantity * @order_detail.product.price
    @order_detail.order_id = Order.maximum(:id).next
    @order_detail.save 
end
  # PATCH/PUT /sp_carts/1 or /sp_carts/1.json
  def update
    respond_to do |format|
      if @sp_cart.update(sp_cart_params)
        format.html { redirect_to sp_cart_url(@sp_cart), notice: "Sp cart was successfully updated." }
        format.json { render :show, status: :ok, location: @sp_cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sp_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sp_carts/1 or /sp_carts/1.json
  def destroy
    @sp_cart.destroy

    respond_to do |format|
      format.html { redirect_to sp_carts_url, notice: "Sp cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sp_cart
      @sp_cart = SpCart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sp_cart_params
      params.require(:sp_cart).permit(:id_product, :quantity)
    end
end
