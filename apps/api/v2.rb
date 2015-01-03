module Api
  class V2 < Grape::API

    cascade false

    format :json

    version ['v2'], using: :header, vendor: 'lotus-test', format: :json, cascade: true, strict: true

    before do
      header "X-API-Version", "2"
    end

    resource :version do

      desc "Returns the current API version."
      get do
        { version: '2' }
      end

    end

  end
end
