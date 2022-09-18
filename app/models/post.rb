class Post < ApplicationRecord
  # 画像投稿
  has_one_attached :image
  
  validates :image, presence: true
  validates :brand, presence: true
  validates :title, presence: true
  validates :body, presence: true
  
  
  
  
  # ユーザーとの１対多の紐付け
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites,dependent: :destroy
  # このメソッドの内容は、画像が設置されていない場合はapp/assets/imagesに格納されてるno_image.jpgの画像を表示
  def get_image
    unless image.attached? # 画像、ファイルがあるかどうか
      file_path = Rails.root.join('app/assets/images/no_image.jpg') #画像が保存されていなかった時に、9,10が実行。
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')#9行目を表示するための準備
    end
    image
  end
  
def favorited_by?(user)
  favorites.exists?(user_id: user.id)
end

end
