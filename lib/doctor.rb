require 'pry'

class Doctor

attr_accessor(:id, :name, :specialty)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @specialty = attributes.fetch(:specialty)
  end

end