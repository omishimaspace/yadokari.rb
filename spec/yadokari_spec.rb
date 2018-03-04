require 'spec_helper'
require 'yadokari'

describe 'Reserve' do
  it '予約できること' do
    reserve = Yadokari::Reserve.new
    reserve.check_in_on = Date.new(2018, 3, 3)
    reserve.check_out_on = Date.new(2018, 3, 4)
    reserve.name = 'sakape'
    reserve.email = 'sakape@example.com'
    reserve.tel = '09012341234'
    reserve.men_number = '3'
    reserve.women_number = '2'
    expect(reserve.post(1)['token']).to_not be_nil
  end
end

