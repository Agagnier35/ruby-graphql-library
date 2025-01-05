# frozen_string_literal: true

module Types
  class LibraryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :street_number, Integer
    field :street, String
    field :city, String
    field :library_books, [ Types::LibraryBookType ]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
