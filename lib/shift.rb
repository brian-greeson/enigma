class Shift

    def initialize(key, date, direction = :encrypt, set_size = nil)
      set_size = CharacterSet.new.default_set.size if !set_size
      date_squared = date.to_i ** 2

      @offsets = [
                    offset_a(key, date_squared),
                    offset_b(key, date_squared),
                    offset_c(key, date_squared),
                    offset_d(key, date_squared)
                  ]
      if direction == :decrypt
        @offsets.map! { |offset| - offset }
      end
      # 4.times do |i|
      #   @offsets << key[i..i+1].to_i + date_squared / 10 ** (3 - i) % 10
      # end
    end

    def all
      @offsets
    end

    def offset_a(key, date_squared)
      key[0..1].to_i + date_squared / 1000 % 10

    end

    def offset_b(key, date_squared)
      key[1..2].to_i + date_squared / 100 % 10

    end

    def offset_c(key, date_squared)
      key[2..3].to_i + date_squared / 10 % 10
    end

    def offset_d(key, date_squared)
      key[3..4].to_i + date_squared % 10
    end

end
