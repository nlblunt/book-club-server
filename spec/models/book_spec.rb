require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "With valid invalid params" do
      it "fails with no TITLE" do
          FactoryGirl.create(:book, title: nil)
          
          expect(Book.count).to eq(0)
      end
  end
end
