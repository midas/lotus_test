module Api
  class V1 < Grape::API

    cascade false

    format :json

    version ['v2', 'v1'], using: :header, vendor: 'lotus-test', format: :json, cascade: false, strict: true

    before do
      header "X-API-Version", "1"
    end

    resource :version do

      desc "Returns the current API version."
      get do
        { version: '1' }
      end

    end

  end
end
