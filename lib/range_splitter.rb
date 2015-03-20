class Range
  def split(into: 2, endianness: :big)

    unless [:big, :little].include?(endianness)
      err = 'The endianness parameter must be either :big or :little'
      raise ArgumentError.new(err)
    end

    into = into.to_i
    if into <= 0
      err = "Cannot split #{self} into #{into} ranges."
      raise ArgumentError.new(err)
    end

    quotient = count.div into
    modulo = count % into

    from = min

    group_count = [count, into].min

    Enumerator.new do |splitted|
      group_count.times do |index|
        step = quotient - 1

        if modulo > 0
          step += if endianness == :little
                    (index + 1 > group_count - modulo ? 1 : 0)
                  else
                    (modulo > index ? 1 : 0)
                  end
        end

        to = from + step
        splitted << (from..to)
        from = to + 1
      end
    end

  end

end
