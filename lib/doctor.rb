require 'pry'


class Doctor

attr_accessor(:id, :name, :specialty)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @specialty = attributes.fetch(:specialty)
  end

  def self.all 
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      id = doctor.fetch("id").to_i
      specialty = doctor.fetch("specialty")
      doctors.push(Doctor.new({name: name, id: id, specialty: specialty}))
    end
    doctors
  end

  def ==(doctor_to_compare)
    self.name() == doctor_to_compare.name()
  end

  def save
    result = DB.exec("INSERT INTO doctors (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    doctor = DB.exec("SELECT * FROM doctors WHERE id = #{id};").first
    name = doctor.fetch("name")
    id = doctor.fetch("id").to_i
    specialty = doctor.fetch("specialty")
    Doctor.new({name: name, id: id, specialty: specialty })
  end

  def update(name)
    @name = name
    DB.exec("UPDATE albums SET name = '#{@name}' WHERE id = #{@id};")
  end

end