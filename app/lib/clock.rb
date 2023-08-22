class Clock < Time
  class << self
    def utc
      if @utc
        time = @utc
        @utc = nil

        return time
      end

      Time.now.utc.to_s
    end

    attr_writer :utc
  end
end
