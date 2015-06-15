require 'watir-webdriver'
require 'headless'
class Douyu < Grape::API
  headless = Headless.new
  headless.start
  _browser = Watir::Browser.start "http://www.douyutv.com/228649"

  post '/danmu' do
    all_text = _browser.text
    danmu_basic = all_text.split("\n")
    danmu_length = danmu_basic.count - 5
    danmu = danmu_basic[40..danmu_length]
    { code: 0, data: { danmu: danmu } }
  end

end
