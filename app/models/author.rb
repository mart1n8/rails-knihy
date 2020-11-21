class Author < ApplicationRecord
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  mount_uploader :photo, AuthorPhotoUploader

  belongs_to :nation, optional: true
  belongs_to :user
  has_many :books, dependent: :destroy
  has_many :comments, :as => :commentable

  validates :first_name, presence: { message: "^#{I18n.t('author.first_name').capitalize} nemôže byť prázdne." }
  validates :last_name, presence: { message: "^#{I18n.t('author.last_name').capitalize} nemôže byť prázdne." }


  scope :search, ->(name) { select("id, first_name, last_name, slug").where("first_name LIKE '%#{name}%' OR last_name LIKE '%#{name}%'") }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end


  


end
