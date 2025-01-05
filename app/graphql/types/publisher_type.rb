# frozen_string_literal: true

module Types
  class PublisherType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :books, Types::BookType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
