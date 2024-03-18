class Example
  def initialize
    @text = "Hello world"
  end

  def say_hello
    puts @text
  end
end

example = Example.new

example.say_hello
# => Hello world
