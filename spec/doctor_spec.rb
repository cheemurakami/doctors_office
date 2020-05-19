require 'rspec'
require 'doctor'
require 'patient'
require 'pry'
require 'spec_helper'

describe ('Doctor') do
  describe('initialize') do
    it('creates a doctor') do
      doctor1 = Doctor.new({name: "chi", id: nil, specialty: "allergists"})
      expect(doctor1.specialty).to eq("allergists")
    end
  end

  describe('.all') do
    it('returns and empty array when there are no doctors') do
    expect(Doctor.all).to(eq[])
  end
end

  describe('#save') do
    it("saves a doctor") do
      doctor1 = Doctor.new({name: "chi", id: nil, specialty: "allergists"})
      doctor1.save
      doctor2 = Doctor.new({name: "jozy", id: nil, specialty: "parasitologist"})
      doctor2.save
      expect(Doctor.all).to eq([doctor1, doctor2])
    end
  end

  describe('#==') do
    it("is the same doctor if it has the same attributes as another doctor") do
      doctor = Doctor.new({name: "chi", id: nil, specialty: "allergists"})
      doctor2 = Doctor.new({name: "jozy", id: nil, specialty: "parasitologist"})
      expect(doctor).to(eq(doctor2))
    end
  end


end

# EXAMPLES FOR TESTING 
# describe '#Class' do
#   before(:each) do
#     Class.clear()
#     @class_variable = Class.new()
#     @class_variable.save()
#   end

#   describe('method') do
#     it("describe test here") do
#       expect(method).to(eq(something))
#     end
#   end
# end