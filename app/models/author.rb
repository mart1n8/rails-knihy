class Author < ApplicationRecord
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  mount_uploader :photo, AuthorPhotoUploader

  belongs_to :nation, optional: true


  validates :first_name, presence: { message: "^#{I18n.t('author.first_name').capitalize} nemôže byť prázdne." }
  validates :last_name, presence: { message: "^#{I18n.t('author.last_name').capitalize} nemôže byť prázdne." }




  def full_name
    "#{self.first_name} #{self.last_name}"
  end


  def user_id
    if user_signed_in?
      self.user_id = current_user.ids
    else
      self.user_id = 1
    end
  end

end
