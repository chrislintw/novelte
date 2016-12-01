# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def random_tags
  Faker::Hipster.words([4,5,6,7,8,9].sample)
end

def create_chapters(novel)
  u = User.first
  c1 = novel.chapters.create(
    title: Faker::Book.title,
    outline: Faker::Hipster.paragraph,
    contents: Faker::Hipster.paragraph(40),
    chapter_num: 1,
    author_id: u.id,
    status: 'main'
  )
  c2 = novel.chapters.create(
    title: Faker::Book.title,
    outline: Faker::Hipster.paragraph,
    contents: Faker::Hipster.paragraph(40),
    chapter_num: 2,
    author_id: u.id,
    status: 'main',
    previous_chapter_id: c1.id
    )
  c3 = novel.chapters.create(
    title: Faker::Book.title,
    outline: Faker::Hipster.paragraph,
    contents: Faker::Hipster.paragraph(40),
    chapter_num: 3,
    author_id: u.id,
    status: 'main',
    previous_chapter_id: c2.id
  )

  c1.update_attributes(next_chapter_id: c2.id)
  c2.update_attributes(next_chapter_id: c3.id)
  novel.update_attributes(chpaters_count: 3)
end
User.create(
  email: 'q26766@gmail.com',
  password: '123123123',
  nickname: 'Chris',
  pen_name: 'Aaron',
  first_name: 'Can',
  last_name: 'Lin',
)

6.times do |i|
  a = Novel.create(title: Faker::Book.title, chapters_number: 13, summary: Faker::Hipster.paragraph,image: File.open(File.join(Rails.root, "/spec/fixtures/taiwan/#{(1..8).to_a.sample}.jpg")))
  b = Novel.create(title: Faker::Book.title, chapters_number: 13, summary: Faker::Hipster.paragraph, status: 1,image: File.open(File.join(Rails.root, "/spec/fixtures/taiwan/#{(1..8).to_a.sample}.jpg")))
  a.tag_list = random_tags
  b.tag_list = random_tags
  create_chapters(a)
  create_chapters(b)

  User.create(email: Faker::Internet.free_email, password: '123123123', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

#=== Categories ===

Category.create([
  {name: 'Adventure'},
  {name: 'Religious'},
  {name: 'Fantasy'},
  {name: 'Historical'},
  {name: 'Horror'},
  {name: 'Humorous'},
  {name: 'Mystery'},
  {name: 'Romance'},
  {name: 'Science Fiction'},
  {name: 'Thriller'},
  {name: 'Adult'},
])