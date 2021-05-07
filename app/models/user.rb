class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books,dependent: :destroy
  has_many :book_coments,dependent: :destroy
  has_many :favorites,dependent: :destroy

  attachment :profile_image, destroy: false

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction,length: {maximum: 50}

  has_many :reverse_of_relationships,class_name:"Relationship",foreign_key: "followed_id",dependent: :destroy
  has_many :followers,through: :reverse_of_relationships,source: :follower
  has_many :relationships,class_name:"Relationship",foreign_key:"follower_id",dependent: :destroy
  has_many :followings,through: :relationships,source: :followed
  


 def self.looks(search,word)
   if search=="perfect_match"
      @user=User.where("name LIKE?","#{word}")
   elsif search=="forward_match"
     @user=User.where("name LIKE?","#{word}%")
   elsif search=="backword_match"
     @user=User.where("name LIKE?","%#{word}")
   else search=="partical_match"
     @user=User.where("name LIKE?","%#{word}%")
     
   end  
 end
     

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
