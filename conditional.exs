defmodule Conditional do
  def cond_case1 do
    case {1,2,3} do
      {4,5,6} -> "This clause won't match"
      {1,x,3} -> "This clause will match and bind x to 2"
      _       -> "This clause would match any value" 
    end
  end

  def cond_case2 do
    x = 1
    case 10 do
      ^x -> "Won't match"
      _  -> "Will match"
    end
  end

  def cond_case3 do
    case {1,2,3} do
      {1,x,3} when x > 2 -> "Will match"
      _                  -> "Won't match, if guard condition were not satisfied"
    end
  end
end

IO.puts Conditional.cond_case1()
IO.puts Conditional.cond_case2()
IO.puts Conditional.cond_case3()


