class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :content, presence: { message: '저장할 댓글이 없습니다. '}, length: { maximum: 255, message: "댓글은 255자를 초과할 수 없습니다." }
end
