class Task < ApplicationRecord
  validates :name, presence: true #nameが空の場合、エラーを返す。
  validates :name, length: { maximum: 30 } #nameが30文字以上の時、エラーを返す

  validate :validate_name_not_including_comma

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
