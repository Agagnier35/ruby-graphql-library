class LibraryBook < ApplicationRecord
  belongs_to :library
  belongs_to :book
  belongs_to :rented_by, class_name: "Customer", optional: true
end
