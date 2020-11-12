class BookCategory < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    validates :title, presence:  { message: "^Názov kategórie nemôže byť prázdny."  } 
    validates :title, uniqueness:  { message: "^Tento názov kategórie  sa už v databáze nachádza."  } 

end
