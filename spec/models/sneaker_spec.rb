require 'rails_helper'

RSpec.describe Sneaker, type: :model do
  it { should belong_to(:brand) }
  it { should belong_to(:sport) }
  it { should have_and_belong_to_many(:users) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:image_url) }
  it { is_expected.to validate_presence_of(:footlocker_url) }
end
