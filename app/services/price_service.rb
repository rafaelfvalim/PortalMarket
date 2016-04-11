class PriceService

  def create_price(params)
    @scripts = params[:scripts]
    prices ||= Array.new
    @scripts.each do |key, s|
      Script.find(s[:id]).update_attribute(:complexity, s[:complexity])
      price = Price.new
      p s[:price][:currency_data]
      date = DateTime.parse(s[:price][:currency_data]) unless s[:price][:currency_data] == ""
      price.attributes = {script_id: s[:id], value: s[:price][:value], currency_id: s[:price][:currency_id], currency_data: date, aggregate_percentage: s[:price][:aggregate_percentage]}
      if price.value.present? && price.currency_id.present? && price.aggregate_percentage.present? && price.currency_data.present?
        prices.push(price)
      end
    end
    prices
  end

end
