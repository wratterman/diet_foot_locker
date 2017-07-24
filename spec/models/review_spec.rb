require 'rails_helper'

RSpec.describe Review, type: :model do
  context "validations and associations" do
     it { should belong_to(:user) }
     it { is_expected.to validate_presence_of(:body) }
   end
end
