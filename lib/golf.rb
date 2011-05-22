class Golf
  class << self
    def hole1(p)
      p.inject(:*)
    end
  
    def hole2(w)
      w.split.sort_by {|w| w[1]}.join(" ")
    end
  
    def hole3(n)
      n.downto(2).inject(:*)
    end
  
    def hole4(o)
      o.map { |t| t.sub(/(man.*)/,'hat(\1)').sub(/dog\((.*)\)/,'dog(\1(bone))').sub(/cat/,'dead') }
    end
  
    def hole5(n)
      x = []
      (1..4).each { |i| x += n.each_cons(i).to_a }
      x
    end
  
    def hole6(m)
      (1..m).map { |i|
        (i % 15 == 0) ? "fizzbuzz" : (i % 5 == 0) ? "buzz" : (i % 3 == 0) ? "fizz" : i
      }
    end
  
    def hole8(n)
      (n == 2) ? [1,1] : (a = hole8(n - 1); a.push(a[-1]+a[-2]))
    end
  
    def round(b)
      v = { "red" => 0, "blue" => 0, "yellow" => 0, "green" => 0, nil => 0 }
      b.each { |p| v[p[0]] += 1 }
      rounds = %w(red blue green yellow).sort { |c1,c2| v[c2] <=> v[c1] }
      w = rounds.first
      if 2*v[w] > b.size
        w
      else
        l = rounds.reject { |x| v[x] == 0 }.last
        b.map! { |p| p.reject { |x| x == l } }
        b.reject! { |p| p.empty? }
        round(b)
      end
    end
    
    def hole9(f)
      b = File.open(f).readlines.map { |l| l.chomp.split(", ") }
      round(b)
    end
  end
end
