class Api::V1::BaseController < ApplicationController
  respond_to :json
  helper :api

  private

    def page_params
      params.permit(:page, :page_size)
    end
end
