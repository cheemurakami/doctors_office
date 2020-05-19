require 'pry'


class Doctor

attr_accessor(:id, :name, :birth_date)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @birth_date = attributes.fetch(:birth_date)
  end

#   def self.all 
#     returned_doctors = DB.exec("SELECT * FROM doctors;")
#     doctors = []
#     returned_doctors.each() do |doctor|
#       name = doctor.fetch("name")
#       id = doctor.fetch("id").to_i
#       birth_date = doctor.fetch("birth_date")
#       doctors.push(Doctor.new({name: name, id: id, birth_date: birth_date}))
#     end
#     doctors
#   end

#   def ==(doctor_to_compare)
#     self.name() == doctor_to_compare.name()
#   end

#   def save
#     result = DB.exec("INSERT INTO doctors (name) VALUES ('#{@name}') RETURNING id;")
#     @id = result.first().fetch("id").to_i
#   end

#   def self.find(id)
#     doctor = DB.exec("SELECT * FROM doctors WHERE id = #{id};").first
#     name = doctor.fetch("name")
#     id = doctor.fetch("id").to_i
#     birth_date = doctor.fetch("birth_date")
#     Doctor.new({name: name, id: id, birth_date: birth_date })
#   end

#   def update(name)
#     @name = name
#     DB.exec("UPDATE doctors SET name = '#{@name}' WHERE id = #{@id};")
#   end

#   def delete
#     DB.exec("DELETE FROM doctors WHERE id = #{@id};")
#   end

end