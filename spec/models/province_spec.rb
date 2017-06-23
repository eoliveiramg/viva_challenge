require 'rails_helper'

RSpec.describe Province, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:upper_left_x) }
  it { is_expected.to validate_presence_of(:upper_left_y) }
  it { is_expected.to validate_presence_of(:bottom_right_x) }
  it { is_expected.to validate_presence_of(:bottom_right_y) }
end
