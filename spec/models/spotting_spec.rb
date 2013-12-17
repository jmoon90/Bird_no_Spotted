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
      Spotting.create!(bird_name: 'bluejay', spotted_by: 'Jon', location: 'Somerville')
      Spotting.create!(bird_name: 'bluejay', spotted_by: 'Ann', location: 'Cambridge')
      Spotting.create!(bird_name: 'cardinal', spotted_by: 'Frank', location: 'Boston')
    end
    # OR
    #let(:spotting) { Spotting.create!(bird_name: 'bluejay', spotted_by: 'Jon', location: 'Somerville') }

    it "provides a count of spottings for a given bird" do
      expect(Spotting.bird_count('robin')).to eql(0)
      expect(Spotting.bird_count('cardinal')).to eql(1)
      expect(Spotting.bird_count('bluejay')).to eql(2)
    end

    it "provides a count of spotting for a given location" do
       expect(Spotting.location_count('Somerville')).to eql(1)
       expect(Spotting.location_count('Cambridge')).to eql(1)
       expect(Spotting.location_count('Boston')).to eql(1)
     end
  end
end
