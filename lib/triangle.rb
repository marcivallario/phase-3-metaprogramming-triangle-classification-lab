class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize side1, side2, side3
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if greater_than_zero? && triangle_equality?
      if @side1 == @side2 && @side2 == @side3 && @side3 == @side1
        :equilateral
      elsif @side1 == @side2 || @side2 == @side3 || @side3 == @side1
        :isosceles
      else 
        :scalene
      end
    else 
      raise TriangleError
    end
  end

  class TriangleError < StandardError
    def message
      "This is not a valid triangle."
    end
  end

  private 

  def greater_than_zero?
    @side1 > 0 && @side2 > 0 && @side3 > 0
  end

  def triangle_equality?
    @side1 + @side2 > @side3 && @side2 + @side3 > @side1 && @side3 + @side1 > @side2
  end
end

