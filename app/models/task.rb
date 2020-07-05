class Task < ApplicationRecord

  # before_validation :set_nameless_name #nameが空の場合、「名前なし」と自動入力する。

  validates :name, presence: true #nameが空の場合、エラーを返す。
  validates :name, length: { maximum: 30 } #nameが30文字以上の時、エラーを返す。

  validate :validate_name_not_including_comma #カンマが入っていたら、エラーを返す。

  private

  # def set_nameless_name
  #   self.name = '名前なし' if name.blank?
  # end

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
