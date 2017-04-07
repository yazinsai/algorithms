class Employee
  public # change scope to public

  # Static class variable
  @@count = 0

  # constant
  NAME = "Yazin"

  # constructor
  def initialize(name, age)
    @name, @age = name, age
    @@count += 1
  end

  # class method (uses self so it's defined on employee Class object, not employee object)
  def self.count
    @@count
  end

  # get/set
  def name
    @name
  end
  def name=(name) # convention for setter objects is to append '=' to method name
    @name = name
  end

  # you can replace the above get/set with
  # attr_accessor :name

  private # change scope to private
  def age
    @age
  end
  def age=(age)
    @age = age
  end
end
