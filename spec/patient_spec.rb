# require 'rspec'
# require 'doctor'
# require 'patient'
# require 'pry'
require 'spec_helper'

describe ('Patient') do
  
  describe('initialize') do
    it('creates a patient') do
      patient1 = Patient.new({name: "chi", id: nil, birth_date: '1986/5/23'})
      expect(patient1.birth_date).to eq('1986/5/23')
    end
  end

  describe('.all') do
    it('returns and empty array when there are no patients') do
      expect(Patient.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a patient") do
      patient1 = Patient.new({name: "chi", id: nil, birth_date: nil})
      patient1.save
      patient2 = Patient.new({name: "jozy", id: nil, birth_date: nil})
      patient2.save
      expect(patient.all).to eq([patient1, patient2])
    end
  end

  describe('#==') do
    it("is the same patient if it has the same attributes as another patient") do
      patient = Patient.new({name: "jozy", id: nil, birth_date: nil})
      patient2 = Patient.new({name: "jozy", id: nil, birth_date: nil})
      expect(patient).to(eq(patient2))
    end
  end

  describe(".find") do 
    it("finds a patient by id") do
      patient1 = Patient.new({name: "chi", id: nil, birth_date: nil})
      patient1.save
      patient2 = Patient.new({name: "jozy", id: nil, birth_date: nil})
      patient2.save
      expect(Patient.find(patient1.id)).to(eq(patient1))
    end
  end

  describe("#update") do
    it("updates a patient by id") do
      patient1 = Patient.new({name: "chi", id: nil, birth_date: nil})
      patient1.save
      patient1.update("travis")
      expect(patient1.name).to(eq("travis"))
    end
  end

  describe("#delete") do
    it("deletes a patient by id") do
      patient1 = Patient.new({name: "chi", id: nil, birth_date: nil})
      patient1.save
      patient2 = Patient.new({name: "jozy", id: nil, birth_date: nil})
      patient2.save
      patient1.delete
      expect(Patient.all).to eq([patient2])
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