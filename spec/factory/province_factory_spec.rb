require 'rails_helper'

RSpec.describe ProvinceFactory do
  describe ".build" do
    subject { described_class.build(params) }

    let(:params) do
      {
        name => {
          boundaries: {
            upperLeft: {
              x: upper_left_x,
              y: upper_left_y
            },
            bottomRight: {
              x: bottom_right_x,
              y: bottom_right_y
            }
          }
        }
      }
    end
    let(:name) { "name-foo" }
    let(:upper_left_x) { 600 }
    let(:upper_left_y) { 400 }
    let(:bottom_right_x) { 700 }
    let(:bottom_right_y) { 600 }
    let(:province) { instance_spy Province }

    before do
      allow(Province).to receive(:new)
        .with(
          name: name,
          upper_left_x: upper_left_x,
          upper_left_y: upper_left_y,
          bottom_right_x: bottom_right_x,
          bottom_right_y: bottom_right_y
        ).and_return(province)
    end

    it "expect to return model Province builded" do
      is_expected.to eq [province]
    end
  end
end
