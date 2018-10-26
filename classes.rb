class InnerClass
  attr_accessor :publicField

 def initialize(arg: "SUPER!")
   puts "Superclass constructor with input #{arg}"
   private_function
 end

  def printField
    puts @publicField
  end

  protected
  def protected_function
    puts "Protected Function runnin'"
  end

  private def private_function
    puts "Private Function runnin'"
  end

end

class SubClass < InnerClass
  def initialize(arg: "SUB!")
    puts "Subclass constructor with input #{arg}"
    protected_function
  end
end
innerInstance = InnerClass.new(arg: "Constructor Argument")
innerInstance.publicField = "173467321476C32789777643T732V73117888732476739764376 Lock";
innerInstance.printField

subInstance = SubClass.new(arg: "Constructor Argument")
