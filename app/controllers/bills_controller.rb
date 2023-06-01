class BillsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bill, only: %i[show edit update destroy]

  # GET /bills or /bills.json
  def index
    @bills = @bills = Bill.where(author_id: current_user.id)
  end

  # GET /bills/1 or /bills/1.json
  def show
    @bills = @bills = Bill.where(author_id: current_user.id)
    @items = Item.where(bill_id: params[:id])
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit; end

  # POST /bills or /bills.json
  def create
    @bill = Bill.new(bill_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to bills_url, notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1 or /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to bill_url(@bill), notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1 or /bills/1.json
  def destroy
    @bill.destroy

    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bill
    @bill = Bill.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bill_params
    params.require(:bill).permit(:name, :icon, :author_id)
  end

  def calculate_item_count(bill)
    Item.where(bill_id: bill.id).count
  end

  def calculate_item_amount(bill)
    @items = Item.where(bill_id: bill.id)
    item_amount = 0
    @items.each do |item|
      item_amount += item.amount
    end
    item_amount
  end
end
