class IdentityGenerator
  class << self
    def next
      if @next
        identity = @next
        @next = nil

        return identity
      end

      SecureRandom.uuid
    end

    attr_writer :next
  end
end
