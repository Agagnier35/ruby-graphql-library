# frozen_string_literal: true

module Types
  class LibraryBookType < Types::BaseObject
    field :id, ID, null: false
    field :library, Types::LibraryType
    field :book, Types::BookType
    field :state, String
    field :renting_price, Integer
    field :rented_by, Types::CustomerType
    field :rented_since, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
