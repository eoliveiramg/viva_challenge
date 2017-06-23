class Api::V1::ProvincesController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      @response = prepare_provinces_to_save.map do |province_param|
        Province.create!(province_param)
      end
    end

    json_response(@response, :created)
  end

  private

  def prepare_provinces_to_save
    ProvinceParser.parse(province_params)
  end

  def province_params
    # whitelist params
    params.require(:provinces).permit!
  end
end