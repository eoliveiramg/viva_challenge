class Api::V1::ProvincesController < ApplicationController
  attr_reader :provinces

  def create
    @provinces = ProvinceFactory.build(province_params)

    ActiveRecord::Base.transaction do
      provinces.map do |province|
        province.save!
      end
    end

    respond_with :api, :v1, @provinces, status: :created
  end

  private

  def province_params
    # whitelist params
    params.require(:provinces).permit!
  end
end