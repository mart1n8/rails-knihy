class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true



  validates :text, presence: { message: "^Text komentáru nemôže byť prázdny."}


end
