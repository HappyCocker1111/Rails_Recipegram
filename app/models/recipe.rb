class Recipe < ApplicationRecord
    belongs_to :user
    attachment :image

    #空白の投稿をさせないバリデーションをかける
    with_options presence: true do
        validates :title
        validates :body
        validates :image
    end
end
