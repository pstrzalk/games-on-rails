module ViewData
  module ReadModels
    module ReadModel
      def save_record(game_id, attributes = {})
        attributes_with_unique_identity = attributes.merge(id: game_id)

        upsert(attributes_with_unique_identity, unique_by: :id)
      end
    end
  end
end
