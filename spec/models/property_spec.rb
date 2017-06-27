require 'rails_helper'

RSpec.describe Property, type: :model do
  let(:property) { build :property, lat: 444, long: 600 }

  it { is_expected.to have_many(:locations) }
  it { is_expected.to have_many(:provinces) }

  it { is_expected.to validate_uniqueness_of(:lat).scoped_to(:long) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:lat) }
  it { is_expected.to validate_presence_of(:long) }
  it { is_expected.to validate_presence_of(:beds) }
  it { is_expected.to validate_presence_of(:baths) }
  it { is_expected.to validate_presence_of(:square_meters) }

  it do
    is_expected.to validate_numericality_of(:lat)
     .is_less_than_or_equal_to(1400).is_greater_than_or_equal_to(0)
  end

  it do
    is_expected.to validate_numericality_of(:beds)
      .is_less_than_or_equal_to(5).is_greater_than_or_equal_to(1)
  end

  it do
    is_expected.to validate_numericality_of(:long)
      .is_less_than_or_equal_to(1000).is_greater_than_or_equal_to(0)
  end

  it do
    is_expected.to validate_numericality_of(:baths)
      .is_less_than_or_equal_to(4).is_greater_than_or_equal_to(1)
  end

  it do
    is_expected.to validate_numericality_of(:square_meters)
      .is_less_than_or_equal_to(240).is_greater_than_or_equal_to(20)
  end

  it "triggers set_location after save" do
    expect(property).to receive(:set_location)
    property.save
  end

  describe ".find_by_coordinates" do
    subject do
      described_class.find_by_coordinates(
        upper_x: upper_x, upper_y: upper_y, bottom_x: bottom_x, bottom_y: bottom_y
      )
    end

    let(:upper_x) { 400 }
    let(:bottom_x)  { 600 }
    let(:upper_y) { 700 }
    let(:bottom_y)  { 500 }
    let(:property_1) { create :property, lat: 444, long: 600 }
    let(:property_2) { create :property, lat: 700, long: 100 }

    it "expect to return correct property after filter" do
      is_expected.to eq([property_1])
    end
  end
end
