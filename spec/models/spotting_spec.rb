require 'spec_helper'

describe Spotting do
  describe "validations" do
    let(:valid_attributes) do
      {
        bird_name: "Robin",
        location: "Boston, MA",
        spotted_by: 'Joe Kao'
      }
    end

    let(:spotting) { Spotting.new(valid_attributes) }

    it "is valid when it has all required and valid attributes" do
      expect(spotting).to be_valid
    end

    it "requires a bird name" do
      spotting.bird_name = ""
      expect(spotting).not_to be_valid
    end

    it "requires a location" do
      spotting.location = ""
      expect(spotting).not_to be_valid
    end

    it "requires a spotter" do
      spotting.spotted_by = ""
      expect(spotting).not_to be_valid
    end
  end

  describe '#Count' do
    before(:each) do
      FactoryGirl.create_list(:spotting, 2, bird_name: 'cardinal')
      FactoryGirl.create_list(:spotting, 3, bird_name: 'bluejay')
    end

    it "provides a count of spottings for a given bird" do
      expect(Spotting.bird_count('robin')).to eql(0)
      expect(Spotting.bird_count('cardinal')).to eql(2)
      expect(Spotting.bird_count('bluejay')).to eql(3)
    end

    it "provides a count of spotting for a given location" do
       expect(Spotting.location_count('Moon')).to eql(5)
     end
  end
end
