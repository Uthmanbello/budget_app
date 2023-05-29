module BillsHelper
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

  def calculate_total_budget
    @bills.sum { |bill| calculate_item_amount(bill) }
  end
end
