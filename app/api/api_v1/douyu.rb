require 'watir-webdriver'
class Douyu < Grape::API
  _browser = Watir::Browser.new :firefox
  _browser.driver.switch_to.window(_browser.driver.window_handles[0])
  _browser.goto "http://www.douyutv.com/60062"
  post '/danmu' do
    all_text = _browser.text
    danmu_basic = all_text.split("\n")
    danmu_length = danmu_basic.count - 5
    danmu = danmu_basic[40..danmu_length]
    { code: 0, data: { danmu: danmu } }
  end
  post '/restar' do
    _browser.refresh
  end

end