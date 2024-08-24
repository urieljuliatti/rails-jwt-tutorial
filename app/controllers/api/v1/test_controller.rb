module Api
  module V1
    class TestController < ApplicationController
      before_action :authenticate_user!
      def test
        render json: { message: 'Teste' }
      end
    end
  end
end
