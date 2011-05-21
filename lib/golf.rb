class Golf
  class << self
    def hole1(p)
      p.inject(1) { |a,b| a * b }
    end
  
    def hole2(w)
      w.split.sort { |a,b| a[1] <=> b[1] }.join(" ")
    end
  
    def hole3(num)
      (num == 1) ? 1 : num * hole3(num - 1)
    end
  
    def hole4(things)
      things.map { |t| t.sub(/(man.*)/,'hat(\1)').sub(/dog\((.*)\)/,'dog(\1(bone))').sub(/cat/,'dead') }
    end
  
    def hole5(nums)
      sublists = []
      4.times { |l| 4.times { |i| sublists << nums[i..i+l] } }
      sublists.uniq
    end
  
    def hole6(m)
      1.upto(m).map { |i|
        if i % 15 == 0
          "fizzbuzz"
        elsif i % 3 == 0
          "fizz"
        elsif i % 5 == 0
          "buzz"
        else
          i
        end
      }
    end
  
    def hole8(n)
      if n == 2
        [1,1]
      else
        a = hole8(n - 1)
        a.push(a[-1]+a[-2])
      end
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
