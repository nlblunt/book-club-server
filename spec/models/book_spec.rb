require 'rails_helper'

RSpec.describe Book, type: :model do
    it "is invalid without a name" do
        expect(FactoryGirl.build(:book, title: nil)).not_to be_valid
    end
  
    it "is invalid without a name" do
        expect(FactoryGirl.build(:book, author: nil)).not_to be_valid
    end
end
