
class Shift
    def initialize(key, date)
      date = date.to_i ** 2
      @offsets = []
      4.times do |i|
        @offsets << key[i..i+1].to_i + date / 10 ** (3 - i) % 10
      end
    end

    def all
      @offsets
    end

    def offset_a
      @offsets[0]
    end

    def offset_b
      @offsets[1]
    end

    def offset_c
      @offsets[2]
    end

    def offset_d
      @offsets[3]
    end
end
