class UnionFind
  def initialize(n) # n: number of elements in the forest
    @par  = []
    @rank = []
    @vs   = []  
    n.times do |i|
      @par[i] = i
      @rank[i] = 0
      @vs[i] = 1
    end
  end
  attr_accessor :par, :rank, :vs

  def find(x)
    raise "x = #{x} is out of range 0..#{@par.size - 1}" unless @par[x]
    if @par[x] == x
      return x
    else
      return find( @par[x] )
    end
  end

  def unite( x, y )
    xrt = find(x)
    yrt = find(y)
    return if xrt == yrt
    
    if @rank[xrt] > @rank[yrt]
      @par[yrt] = xrt
      @vs[xrt] += @vs[yrt]
    else
      @par[xrt] = yrt
      @vs[yrt] += @vs[xrt]
      @rank[yrt] += 1 if @rank[xrt] == @rank[yrt]
    end
  end

  def same( x, y ) # returns true/false
    return find( x ) == find( y )
  end

end # UnionFind
