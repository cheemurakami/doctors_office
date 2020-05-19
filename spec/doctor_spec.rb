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