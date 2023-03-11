class Test < ApplicationRecord
    belongs_to :user
    has_many :tasks, dependent: :destroy

    validates :title,presence: true, length: { minimum: 1, maximun: 50 }
end
