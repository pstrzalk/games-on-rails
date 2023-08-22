module WithDomainEvents
  module Repository
    private

    def commit_events(entity, copy_event_id_to: nil)
      return if entity.uncommited_events.blank?

      entity.uncommited_events.each do |event|
        event.send("#{copy_event_id_to}=", entity.id) if copy_event_id_to

        @event_store_write.call(event)
      end

      entity.clear_uncommited_events
    end
  end
end
