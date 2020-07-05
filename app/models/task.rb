class Task < ApplicationRecord
  validates :name, presence: true #nameが空の場合、エラーを返す。
  validates :name, length: { maximum: 30 } #nameが30文字以上の時、エラーを返す
end
