class CafeController < ApplicationController
  def index
    @menu = {
      latte: 4.00,
      scone: 5.00,
      tea: 3.00
    }

    @currency_symbol = '$'
  end

  def about
    @menu = {
      latte: 4.00,
      scone: 5.00,
      tea: 3.00
    }
    render json: @menu
  end
end
