require "faker"
require "uri"
require "open-uri"

Book.delete_all
Genre.delete_all

image_client = Pexels::Client.new()

genre_names = [
  "Science Fiction", "Fantasy", "Mystery", "Thriller", "Romance",
  "Historical", "Non-Fiction", "Horror", "Biography", "Self-Help"
]

genre_names.each do |genre_name|
  genre = Genre.create(
    name: genre_name,
    description: Faker::Lorem.sentence(word_count: 10) # Random description for genre
  )
  puts "Created Genre: #{genre.name}"

  rand(25..50).times do
    book = Book.create(
      title: Faker::Book.title,
      author: Faker::Book.author,
      publisher: Faker::Book.publisher,
      synopsis: Faker::Lorem.paragraph(sentence_count: rand(3..5)), # Random synopsis
      price_cents: rand(500..2000), # Price in dollars
      on_sale: [ true, false ].sample, # Randomly set on_sale
      genre_id: genre.id # Associate the book with the genre
    )

    pexel_response = image_client.photos.search(book.title)

    if pexel_response.photos.any?
      # Open image URL and attach to the book
      downloaded_image = URI.open(pexel_response.photos[0].src["medium"])
      book.image.attach(io: downloaded_image, filename: "#{book.title.parameterize}.jpg", content_type: "image/jpg")
      puts "Attached image from Pexels to Book: #{book.title}"
    else
      puts "No image found for #{book.title} on Pexels."
    end

    puts "Created Book: #{book.title} in Genre #{genre.name}"
  end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.find_by(email: 'admin@example.com').nil?
