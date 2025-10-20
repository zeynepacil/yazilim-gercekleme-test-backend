# Mevcut verileri temizle
Comment.destroy_all
Post.destroy_all
User.destroy_all
Category.destroy_all
Tag.destroy_all

puts "Veri tabanı temizlendi."

# 1. Kullanıcılar
user_alice = User.create!(username: "alice", email: "alice@blog.com")
user_bob = User.create!(username: "bob", email: "bob@blog.com")

# 2. Kategoriler
category_tech = Category.create!(name: "Teknoloji")
category_food = Category.create!(name: "Yemek")

# 3. Etiketler
tag_rails = Tag.create!(name: "Rails")
tag_api = Tag.create!(name: "API")
tag_tarif = Tag.create!(name: "Tarif")

# 4. Gönderiler
post1 = user_alice.posts.create!(
  title: "Rails API İle Hello Demek", 
  body: "Merhaba! 5 Model ve 5 İlişki ile API yapıyoruz.", 
  category: category_tech
)

post2 = user_bob.posts.create!(
  title: "Basit Bir Akşam Yemeği", 
  body: "Hızlı ve lezzetli bir tarif.", 
  category: category_food
)

# N:M İlişkisi: Postlara etiket ekleme
post1.tags << [tag_rails, tag_api]
post2.tags << tag_tarif

# 5. Yorumlar
# Kullanıcılı yorum
post1.comments.create!(body: "Mükemmel bir anlatım!", user: user_bob)
# Anonim yorum
post1.comments.create!(body: "Çok hızlı çalıştığına eminim.", user: nil)

puts "Test verileri başarıyla oluşturuldu."