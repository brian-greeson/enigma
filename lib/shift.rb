class Shift

    def initialize(key, date, direction = :encrypt)
      @key  = key
      @date = date
      @offsets = [
                    shift_a,
                    shift_b,
                    shift_c,
                    shift_d
                  ]
      set_direction(direction)
      # All theses methods and typing, just to do this...
      # 4.times do |i|
        # @offsets << key[i..i+1].to_i + date_squared / 10 ** (3 - i) % 10
      # end
      # Which is more readable?
    end

    def date_squared
       @date_squared ||= @date.to_i ** 2
    end

    def set_direction(direction)
      @offsets.map! { |offset| - offset } if direction == :decrypt
    end

    def all
      @offsets
    end

    def shift_a
      key_a + date_offset_a
    end

    def shift_b
      key_b + date_offset_b
    end

    def shift_c
      key_c + date_offset_c
    end

    def shift_d
      key_d + date_offset_d
    end

    def date_offset_a
       date_squared / 1000 % 10
    end

    def date_offset_b
      date_squared / 100 % 10
    end

    def date_offset_c
      date_squared / 10 % 10
    end

    def date_offset_d
      date_squared % 10
    end

    def key_a
      @key[0..1].to_i
    end

    def key_b
      @key[1..2].to_i
    end
    def key_c
      @key[2..3].to_i
    end
    def key_d
      @key[3..4].to_i
    end

end
