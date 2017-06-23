require 'rails_helper'

RSpec.describe Province, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:upper_left_x) }
  it { is_expected.to validate_presence_of(:upper_left_y) }
  it { is_expected.to validate_presence_of(:bottom_right_x) }
  it { is_expected.to validate_presence_of(:bottom_right_y) }

  describe '#get_all_coordinates' do
    subject { province.get_all_coordinates }

    let(:province) { build :province }
    let(:expected_value) do
      {
        upper_left_x: province.upper_left_x,
        upper_left_y: province.upper_left_y,
        upper_right_x: province.bottom_right_x,
        upper_right_y: province.upper_left_y,
        bottom_left_x: province.upper_left_x,
        bottom_left_y: province.bottom_right_y,
        bottom_right_x: province.bottom_right_x,
        bottom_right_y: province.bottom_right_y
      }
    end

    it "is expect return hash that include all coordenates" do
      expect(subject).to eq(expected_value)
    end
  end
end
