require 'grape-swagger'

class API < Grape::API


  prefix "api/v1"
  content_type :json, "application/json;charset=UTF-8"
  format :json
  formatter :json, Grape::Formatter::Jbuilder

  before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
  end

  mount Douyu

  add_swagger_documentation mount_path: 'doc.json', api_version: 'v1'
end
