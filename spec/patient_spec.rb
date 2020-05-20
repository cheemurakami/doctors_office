# require 'rspec'
# require 'doctor'
# require 'patient'
# require 'pry'
require 'spec_helper'

describe ('Patient') do

  before(:each) do
    @doctor = Doctor.new({name: "chi", id: nil, specialty: "allergists"})
    @doctor.save
  end
  
  describe('initialize') do
    it('creates a patient') do
      patient1 = Patient.new({name: "chi", id: nil, birthdate: '1986/5/23', doc_id: @doctor.id})
      expect(patient1.birthdate).to eq('1986/5/23')
    end
  end

  describe('.all') do
    it('returns and empty array when there are no patients') do
      expect(Patient.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a patient") do
      patient1 = Patient.new({name: "chi", id: nil, birthdate: nil, doc_id: @doctor.id})
      patient1.save
      expect(Patient.all).to eq([patient1])
    end
  end

  describe('#==') do
    it("is the same patient if it has the same attributes as another patient") do
      patient = Patient.new({name: "jozy", id: nil, birthdate: nil, doc_id: @doctor.id})
      patient2 = Patient.new({name: "jozy", id: nil, birthdate: nil, doc_id: @doctor.id})
      expect(patient).to(eq(patient2))
    end
  end

  describe(".find") do 
    it("finds a patient by id") do
      patient1 = Patient.new({name: "chi", id: nil, birthdate: nil, doc_id: @doctor.id})
      patient1.save
      patient2 = Patient.new({name: "jozy", id: nil, birthdate: nil, doc_id: @doctor.id})
      patient2.save
      found_patient = Patient.find(patient1.id)
      expect(found_patient).to(eq(patient1))
      expect(found_patient.doc_id).to(eq(@doctor.id))

    end
  end

  describe("#update") do
    it("updates a patient by id") do
      patient1 = Patient.new({name: "chi", id: nil, birthdate: nil, doc_id: @doctor.id})
      patient1.save
      patient1.update("travis", @doctor.id)
      expect(patient1.name).to(eq("travis"))
    end
  end

  describe("#delete") do
    it("deletes a patient by id") do
      patient1 = Patient.new({name: "chi", id: nil, birthdate: nil, doc_id: @doctor.id})
      patient1.save
      patient2 = Patient.new({name: "jozy", id: nil, birthdate: nil, doc_id: @doctor.id})
      patient2.save
      patient1.delete
      expect(Patient.all).to eq([patient2])
    end
  end

  describe('#doctor') do
    it("finds the doctor a patient belongs to") do
      patient1 = Patient.new({name: "chi", id: nil, birthdate: nil, doc_id: @doctor.id})
      patient1.save()
      expect(patient1.doctor).to(eq(@doctor))
    end
  end

  describe(".find_by_doctor") do
    it("finds patients for a doctor") do
      patient1 = Patient.new({name: "chi", id: nil, birthdate: nil, doc_id: @doctor.id})
      patient1.save
      patient2 = Patient.new({name: "jozy", id: nil, birthdate: nil, doc_id: @doctor.id})
      patient2.save
      expect(Patient.find_by_doctor(@doctor.id)).to eq([patient1, patient2])
    end
  end

end
