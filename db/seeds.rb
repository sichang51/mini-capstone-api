# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

supplier1 = Supplier.create!(name: "Amazon", email: "abc123@amazon.com", phone_number: "111-222-3333")

supplier2 = Supplier.create!(name: "BestBuy", email: "555@bestbuy.com", phone_number: "555-555-5555")

supplier3 = Supplier.create!(name: "Walmart", email: "abc@walmart.com", phone_number: "888-888-8888")

supplier4 = Supplier.create!(name: "Target", email: "123@target.com", phone_number: "800-800-8000")

product1 = Product.create!(name: "The Godfather Trilogy", price: 89, description: "Enjoy the stunning visual quality and exceptional sound as you watch the epic story of the Corleone family unfold across 549 minutes of intense drama. nnThis set includes all three films of the trilogy, directed by Francis Ford Coppola and featuring an all-star cast.", supplier_id: supplier1.id)

product2 = Product.create!(name: "Scarface", price: 28, description: "One of the most influential gangster epics of all time, Scarface is the rags-to-riches story of Cuban immigrant Tony Montana, who finds wealth, power and passion beyond his wildest dreams…at a price he never imagined. From acclaimed director Brian De Palma and Oscar-winning writer Oliver Stone, this action-packed Blu-ray features an eye-popping remastered picture, explosive 7.1 audio track and exclusive bonus features.", supplier_id: supplier2.id)

product3 = Product.create!(name: "Old School", price: 9, description: "Three men going through a mid-life crisis decide to move in together in a house that borders the local college. They soon discover that their status will increase with the students by hosting parties. To further their enjoyment, they start a fraternity and embark on wacky and wild adventures.", supplier_id: supplier4.id)

product4 = Product.create!(name: "Good Will Hunting", price: 20, description: "A South Boston whiz kid elects to clean the halls of learning rather than enter them, slumming his way through life as a janitor at MIT. But his natural ability to unravel complex equations attracts the attention of a professor who won't let him quit, a beautiful Harvard student who wants to save him, a sympathetic buddy who wants him to escape South Boston, and a counselor who encourages him.", supplier_id: supplier3.id)

product5 = Product.create!(name: "Star Trek Into Darkness", price: 19, description: "When the crew of the Enterprise is called back home, they find an unstoppable force of terror from within their own organization has detonated the fleet and everything it stands for, leaving our world in a state of crisis. With a personal score to settle, Captain Kirk leads a manhunt to a war-zone world to capture a one man weapon of mass destruction. As our heroes are propelled into an epic chess game of life and death, love will be challenged, friendships will be torn apart, and sacrifices must be made for the only family Kirk has left: his crew.", supplier_id: supplier1.id)

product6 = Product.create!(name: "The Lord of the Rings Trilogy - Extended Editions", price: 39, description: "This critically acclaimed epic trilogy follows the quest undertaken by the hobbit, Frodo Baggins, and his fellowship of companions to save Middle-earth by destroying the One Ring and defeating the evil forces of the Dark Lord Sauron. All 3 extended versions on newly remastered discs. Includes the original 9 special features with over 26 hours of spell binding behind the movie making material including the Costa Botes documentaries. 15 Blu-ray discs.", supplier_id: supplier1.id)

# Product.create! - the exclamation point enables the error message for validation

Image.create!(url: "https://m.media-amazon.com/images/I/71gzdebhCjL._SX522_.jpg", product_id: product1.id)

Image.create!(url: "https://m.media-amazon.com/images/I/41KdZ81BiiL._SX300_SY300_QL70_FMwebp_.jpg", product_id: product2.id)

Image.create!(url: "https://m.media-amazon.com/images/I/513ym76u5zL._SX300_SY300_QL70_FMwebp_.jpg", product_id: product3.id)

Image.create!(url: "https://www.movieposters.com/cdn/shop/products/7ef5f3a2970c9eb8dba5bd10d294522c_21e9a29b-ad54-4578-9006-050039f589ce_500x.jpg?v=1573588853", product_id: product4.id)

Image.create!(url: "https://m.media-amazon.com/images/I/91m0gkJXP5L._AC_UF894,1000_QL80_.jpg", product_id: product5.id)

Image.create!(url: "https://theliteraryomnivore.files.wordpress.com/2010/05/lotrtrilogyface.jpg?w=676", product_id: product6)

Image.create!(url: "https://cdn11.bigcommerce.com/s-lj8wphc2lt/products/0/images/1646/godfather-cover__18165.1669740310.1280.1280.jpg?c=2&_gl=1*13qsnbk*_ga*MTczNDMyMDMwNi4xNjY4NDU2ODA4*_ga_WS2VZYPC6G*MTY2OTczNzYxNC44LjEuMTY2OTc0MDMzOS40MS4wLjA.", product_id: product1.id)

Image.create!(url: "https://m.media-amazon.com/images/I/61Tjj0llZGL._AC_UF894,1000_QL80_.jpg", product_id: product2.id)

Image.create!(url: "https://m.media-amazon.com/images/M/MV5BODM1MzU4MzYyNF5BMl5BanBnXkFtZTcwNjY4Nzc3Mw@@._V1_.jpg", product_id: product3.id)

Image.create!(url: "https://variety.com/wp-content/uploads/2023/07/Good-Will-Hunting-Images-Courtesy-of-Park-Circus-Paramount.jpg?w=1000", product_id: product4.id)

Image.create!(url: "https://m.media-amazon.com/images/I/712lsHr4SoL._AC_UF894,1000_QL80_.jpg", product_id: product5.id)

Image.create!(url: "https://www.oregonlive.com/resizer/bM2JVM8OCcI6G9LLMzFiLISATn0=/1280x0/smart/advancelocal-adapter-image-uploads.s3.amazonaws.com/image.oregonlive.com/home/olive-media/width2048/img/ent_impact_tvfilm/photo/starjpg-c2ce99dc82d96fe1.jpg", product_id: product5.id)

Image.create(url: "https://static.wikia.nocookie.net/peter-jacksons-the-lord-of-the-rings-trilogy/images/b/be/The_Lord_of_the_Rings_-_The_Fellowship_of_the_Ring_Poster.jpg/revision/latest?cb=20171231174005", product_id: product6.id)

Image.create(url: "https://imgc.allpostersimages.com/img/posters/lord-of-the-rings-the-return-of-the-king_u-L-F4S5QD0.jpg", product_id: product6.id)
