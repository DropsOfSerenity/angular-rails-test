class Api::V1::BaseController < ApplicationController
  helper :api
  respond_to :json

  private

    def page_params
      params.permit(:page, :page_size)
    end
end
