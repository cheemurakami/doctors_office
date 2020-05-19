require 'pry'

class Doctor

attr_accessor(:id, :name, :specialty)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @specialty = attributes.fetch(:specialty)
  end

  def self.all 
    returned_doctors = DB.execute("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      id = doctor.fetch("id").to_i
      specialty = doctor.fetch("specialty")
      doctors.push(Doctor.new({name: name, id: id, :specialty: specialty}))
    end
    doctors
  end


  def save
    result = DB.exec("INSERT INTO doctors (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

end