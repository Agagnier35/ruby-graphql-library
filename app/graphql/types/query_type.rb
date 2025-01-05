

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [ Types::NodeType, null: true ], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ ID ], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :libraries, [ Types::LibraryType ], null: false,
      description: "Get all libraries"
    def libraries
     Library.all
    end

    field :books, [ Types::BookType ], null: false, description: "Get all books"
    def books
     Book.all
    end

    field :authors, [ Types::AuthorType ], null: false, description: "Get all authors"
    def authors
     Author.all
    end

    field :publishers, [ Types::PublisherType ], null: false, description: "Get all publishers"
    def publishers
     Publisher.all
    end

    field :customers, [ Types::CustomerType ], null: false, description: "Get all customers"
    def customers
     Customer.all
    end
  end
end
