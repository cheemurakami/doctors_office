require 'rspec'
require 'doctor'
require 'patient'
require 'pry'

describe ('Doctor') do
  describe('initialize') do
    it('creates a doctor') do
      doctor1 = Doctor.new({name: "chi", id: nil, specialty: "allergists"})
      expect(doctor1.specialty).to eq("allergists")
    end
  end

  describe('#save') do
    it("saves a doctor") do
      doctor1 = Doctor.new({name: "chi", id: nil, specialty: "allergists"})
      doctor1.save
      doctor2 = Doctor.new({name: "jozy", id: nil, specialty: "parasitologist"})
      doctor2.save
      expect(Doctor.all).to eq([doctor1,])
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