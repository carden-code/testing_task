class Todo < ApplicationRecord
  # Указываю, что задача принадлежит категории
  belongs_to :project

  # указываю, что нужно проверять text на наличие и уникальность
  validates :text, presence: true, uniqueness: true
end
