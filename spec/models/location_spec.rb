require 'rails_helper'

RSpec.describe Location, type: :model do
  it { is_expected.to belong_to(:province) }
  it { is_expected.to belong_to(:property) }
end
