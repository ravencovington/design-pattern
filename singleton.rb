# The singleton pattern is used to ensure that there is only one instance
# of a class and provides global access to that instance.
# This pattern is useful when you want one instance of a class and many
# different objects need to access it, rather than pass the object around,
# we can make the object global.

require 'singleton'

class AppConfig
  include Singleton
  attr_accessor :data

  def version
    '1.0.0'
  end
end

#AppConfig.new # raise NoMethodError private method `new' called for AppConfig:Class (NoMethodError)
# Cannot instantiate a singleton class like a regular class --> need to use instance

first = AppConfig.instance
second = AppConfig.instance
puts first ==  second # returns true. When this method is first called, an
# instance of the class is created, and all subsequent calls return the created instance
puts AppConfig.instance.data = {enabled: true}
puts AppConfig.instance.version
puts second = AppConfig.instance
puts second.data = {enabled: false}
puts AppConfig.instance.data

# sets the data attribute with arbitrary values and check its version.
# duplicates the singleton instance, changes its data value, and confirms
# that the value changed in the single instance.
