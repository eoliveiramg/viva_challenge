class Api::V1::PropertiesController < ApplicationController
  before_action :get_property, only: [:show]

  attr_reader :property

  # POST /properties
  def create
    binding.pry
    @property = PropertyFactory.build(properties_params)
    property.save!

    respond_with :api, :v1, property, status: :created
  end

  # GET /properties/:id
  def show
    respond_with :api, :v1, property, status: :ok
  end

  # GET /properties
  # GET /properties?ax=VAR1&ay=VAR2&bx=VAR3&by=VAR4
  def index
    if params[:ax] && params[:ay] && params[:bx] && params[:by]
      @properties = Property.find_by_coordinates(
        upper_x: params[:ax],
        upper_y: params[:ay],
        bottom_x: params[:bx],
        bottom_y: params[:by]
      )
    else
      @properties = Property.all #in this case is much necessary to implement pagination system
    end

    respond_with :api, :v1, @properties, status: :ok
  end

  private

  def get_property
    @property = Property.find(params.fetch(:id))
  end

  def properties_params
    # whitelist params
    binding.pry
    params.permit(:x, :y, :title, :price, :description, :beds, :baths, :squareMeters)
  end
end