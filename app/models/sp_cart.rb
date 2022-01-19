class SpCart < ApplicationRecord
    has_many :product

    def sub_total
        sum = 0
        self.order_details.each do |order_detail|
        sum+= order_detail.total_price
        end
        return sum
      end
    
      def sum_quan
        sum = 0
        self.order_details.each do |order_detail|
          sum += order_detail.quantity
        end
        sum
      end
    end
end
