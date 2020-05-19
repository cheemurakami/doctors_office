require 'pry'


class Patient

attr_accessor(:id, :name, :birthdate, :doc_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @birthdate = attributes.fetch(:birthdate)
    @doc_id = attributes.fetch(:doc_id)
  end

  def self.all 
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      id = patient.fetch("id").to_i
      birthdate = patient.fetch("birthdate")
      doc_id = patient.fetch("doc_id").to_i
      patients.push(Patient.new({name: name, id: id, birthdate: birthdate, doc_id: doc_id}))
    end
    patients
  end

  def ==(patient_to_compare)
    self.name() == patient_to_compare.name()
  end

  def save
    result = DB.exec("INSERT INTO patients (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    patient = DB.exec("SELECT * FROM patients WHERE id = #{id};").first
    name = patient.fetch("name")
    id = patient.fetch("id").to_i
    birthdate = patient.fetch("birthdate")
    doc_id = patient.fetch("doc_id").to_i
    Patient.new({name: name, id: id, birthdate: birthdate, doc_id: doc_id })
  end

  def update(name)
    @name = name
    DB.exec("UPDATE patients SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM patients WHERE id = #{@id};")
  end

  def doctor
    Doctor.find(@doc_id)
  end
  
end