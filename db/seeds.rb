# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require "uri"
require "open-uri"

Genre.delete_all
Product.delete_all

# Define a list of computer-related categories
categories = [
  { name: 'Storage', description: 'Hard drives, SSDs, and other storage devices' },
  { name: 'Processors', description: 'CPUs and related components' },
  { name: 'Motherboards', description: 'Motherboards for all types of computers' },
  { name: 'Graphics Cards', description: 'GPUs for gaming and professional use' },
  { name: 'Memory', description: 'RAM modules for different systems' },
  { name: 'Cooling', description: 'Cooling solutions like fans and liquid cooling' },
  { name: 'Power Supplies', description: 'PSUs for your computer builds' },
  { name: 'Monitors', description: 'Displays for computers, TVs, and gaming' }
]

# Create the categories
categories.each do |Genre|
  c = Genre.create(name: Genre[:name], description: Genre[:description])
  puts "Created Genre: #{c.name}"

  # Now, create products for each Genre
  rand(15..25).times do
    p = Product.create(
      name: "#{Faker::Commerce.product_name} #{Genre[:name]}",
      description: Faker::Hipster.sentence(word_count: rand(10..15)),
      price_cents: rand(5000..100_000),
      on_sale: [true, false].sample,  # Randomly determine if the product is on sale
      Genre: c
    )

    puts "Created product: #{p.name} in Genre #{c.name}"
  end
end
