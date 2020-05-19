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

  def update(name, doc_id)
    @name = name
    @doc_id = doc_id
    DB.exec("UPDATE patients SET name = '#{@name}', doc_id =#{@doc_id} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM patients WHERE id = #{@id};")
  end

  def self.find_by_doctor(doc_id)
    patients = []
    returned_patients = DB.exec("SELECT * FROM patients WHERE doc_id = #{doc_id};")
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      id = patient.fetch("id").to_i
      birthdate = patient.fetch("birthdate")
      patients.push(Patient.new({name: name, id: id, birthdate: birthdate, doc_id: doc_id}))
    end
    patients
  end

  def doctor
    Doctor.find(@doc_id)
  end

end