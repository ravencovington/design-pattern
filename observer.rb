class Notifier
  def update(car, miles)
    puts "The car has logged #{miles} miles, totaling #{car.mileage} miles traveled."
    puts "The car needs to be taken in for a service!" if car.service <= car.mileage
  end
end

class Car
  attr_reader :mileage, :service

  def initialize(mileage = 0, service = 3000)
    @mileage = mileage
    @service = service
  end

  def log(miles)
    @mileage += miles
  end
end
