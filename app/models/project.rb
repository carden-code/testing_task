class Project < ApplicationRecord
  # Говорю, что одна категория имеет много задач и при удалении категории удалять и все ее задачи
  has_many :todos, dependent: :destroy

  # Указываю, что перед записью нужно проверять name на наличие и уникальность
  validates :title, presence: true, uniqueness: true
end
