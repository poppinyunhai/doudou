require 'watir-webdriver'
require 'headless'
class Douyu < Grape::API
  _browser = Watir::Browser.new :firefox
  _browser.goto "http://www.douyutv.com/229680"
  _browser_2 = Watir::Browser.new :firefox
  _browser_2.goto "http://www.douyutv.com/228649"
  _browser_3 = Watir::Browser.new :firefox
  _browser_3.goto "http://www.douyutv.com/235843"

  params do
    requires :channel
  end
  post '/danmu' do
    if params[:channel] == "1"
      all_text = _browser.text
    elsif params[:channel] == "2"
      all_text = _browser_2.text
    elsif params[:channel] == "3"
      all_text = _browser_3.text
    end
    # _browser_2.refresh
    # if i < 2
    #   all_text = _browser_2.text
    #   i = i + 1
    # end
    # if i >= 2 && i < 5
    #   _browser_2.refresh
    #   all_text = _browser.text
    #   i = i + 1
    # elsif i >= 4 && i < 6
    #   all_text = _browser.text
    #   i = i + 1
    # elsif i >= 6
    #   _browser.refresh
    #   all_text = _browser_2.text
    #   i = 0
    # end      
    # if i == 4
    #   all_text = _browser.text
    #   i = i + 1
    # end
    # if i == 5
    #   _browser.refresh
    #   all_text = _browser.text
    #   i = 0
    # end
    # if i > 4 && i < 7
    #   all_text = _browser.text
    #   i = i + 1
    # end
    # if i >= 7
    #   _browser.refresh
    #   i = 0
    # end
    danmu_basic = all_text.split("\n")
    danmu_length = danmu_basic.count - 5
    danmu = danmu_basic#[40..danmu_length]
    if danmu != nil
      { code: 0, data: { danmu: danmu} }  
    else
      { code: 0, data: { danmu: "" } }
    end
  end

  post '/danmu_2' do
    if params[:channel]
      _browser_2.refresh
    else
      _browser.refresh
    end
    
    { code: 0, data: {} }
    # all_text = _browser_2.text
    # danmu_basic = all_text.split("\n")
    # danmu_length = danmu_basic.count - 5
    # danmu = danmu_basic[40..danmu_length]
    # { code: 0, data: { danmu: danmu } }
  end
end
