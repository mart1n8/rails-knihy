class Book < ApplicationRecord
    extend FriendlyId
    friendly_id :slug_string, use: :slugged


    has_and_belongs_to_many :book_categories
    has_and_belongs_to_many :authors
    mount_uploader :cover_img, BookCoverImgUploader


    validates :name, presence: { message: "^Názov knižky nemôže byť prázdne."}
    validates :authors, presence: { minimum: 1, message: "^Musíte pridať aspoň jedného autora." }


    def slug_string
        return "#{self.authors[0].full_name} #{self.name}" if self.authors.count > 0
        "#{self.name}"
    end



    def authors_hash_list
        authors_list  = Hash.new
        self.authors.collect do |author|
          authors_list[author.id] = author.full_name
        end
        return authors_list
    end
end
