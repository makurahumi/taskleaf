class Task < ApplicationRecord
  validates :name, presence: true #nameが空の場合、エラーを返す。
end
