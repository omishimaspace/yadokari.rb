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
    reserve.check_in_time = '15:00'
    reserve.purpose_of_use = '開発合宿'
    reserve.payment_method = 'card'
    reserve.coupon = 'xxxxx'
    reserve.note = 'よろしく！'
    expect(reserve.post(1)['token']).to_not be_nil
  end
end

describe 'Yado' do
  it '宿一覧' do
    yado = Yadokari::Yado.new
    yado = yado.list.first
    expect(yado['name']).to eq 'オオミシマスペース'
    expect(yado['short_name']).to eq 'os'
  end
end
