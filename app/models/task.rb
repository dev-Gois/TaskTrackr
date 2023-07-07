class Task < ApplicationRecord
  belongs_to :user
  belongs_to :tag, optional: true
  belongs_to :list, optional: true
  has_many :comments, dependent: :destroy
  has_many :subtasks, dependent: :destroy
end
