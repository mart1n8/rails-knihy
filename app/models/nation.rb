class Nation < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged
    mount_uploader :flag, NationUploader

    validates :title, presence:  { message: "^Národnosť nemôže byť prázdna."  } 
    validates :title, uniqueness:  { message: "^Táto národnosť sa už v databáze nachádza."  } 
    validates :flag, presence: { message: "^Vlajka národnosti nemôže byť prázdna."  } 

    
end
