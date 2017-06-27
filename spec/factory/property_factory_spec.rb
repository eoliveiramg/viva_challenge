require 'rails_helper'

RSpec.describe PropertyFactory do
  describe ".build" do
    subject { described_class.build(params) }

    let(:params) do
      {
        title: title,
        description: description,
        price: price,
        x: x,
        y: y,
        beds: beds,
        baths: baths,
        squareMeters: squareMeters
      }
    end
    let(:title) { "tittle-foo" }
    let(:description) { "description-foo" }
    let(:price) { 123423 }
    let(:x) { 400 }
    let(:y) { 700 }
    let(:beds) { 3 }
    let(:baths) { 2 }
    let(:squareMeters) { 160 }
    let(:property) { instance_spy Property }

    before do
      allow(Property).to receive(:new)
        .with(
          title: title,
          description: description,
          price: price,
          lat: x,
          long: y,
          beds: beds,
          baths: baths,
          square_meters: squareMeters
        ).and_return(property)
    end

    it "expect to return model Property builded" do
      is_expected.to eq property
    end
  end
end
