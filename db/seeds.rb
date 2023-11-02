# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

supplier1 = Supplier.create!(name: "Microsoft", email: "abc123@microsoft.com", phone_number: "111-222-3333")

supplier2 = Supplier.create!(name: "Sony", email: "555@sony.com", phone_number: "555-555-5555")

supplier3 = Supplier.create!(name: "Activision", email: "abc@activision.com", phone_number: "888-888-8888")

supplier4 = Supplier.create!(name: "Electronic Arts", email: "123@ea.com", phone_number: "800-800-8000")

product1 = Product.create!(name: "Xbox Series X", price: 560, description: "Xbox Series X, the fastest, most powerful Xbox ever. Explore rich new worlds with 12 teraflops of raw graphic processing power, DirectX ray tracing, a custom SSD, and 4K gaming. Make the most of every gaming minute with Quick Resume, lightning-fast load times, and gameplay of up to 120 FPS—all powered by Xbox Velocity Architecture.", supplier_id: supplier1.id)

product2 = Product.create!(name: "Playstation 5", price: 500, description: "Powered by an eight-core AMD Zen 2 CPU and custom AMD Radeon GPU, the PS5 is offered in two models: with and without a 4K Blu-ray drive. Supporting a 120Hz video refresh, the PS5 is considerably more powerful than the PS4 and PS4 Pro. Rather than GDDR5 memory, GDDR6 is supported with capacity doubled from 8 to 16GB.", supplier_id: supplier2.id)

product3 = Product.create!(name: "Madden NFL 2024", price: 70, description: "Madden NFL 24 introduces exclusive next gen features, including SAPIEN technology, which allows for more realistic movement and more lifelike player models. Gameplay includes the return of refs to the field, improved blocking and Fieldsense.", supplier_id: supplier4.id)

product4 = Product.create!(name: "Call of Duty: Modern Warfare 2", price: 70, description: "Call of Duty: Modern Warfare 2 is a first person shooter, and its gameplay revolves around fast-paced gunfights against enemy combatants. The player controls a soldier who can perform several actions, including jump, sprint, crouch, lay prone, and aim down their gun's iron sights.", supplier_id: supplier3.id)

product5 = Product.create!(name: "Xbox Series X Controller", price: 50, description: "For Xbox Series X|S, we’ve streamlined the Xbox Wireless Controller for comfort, performance, and instant sharing. The controller also works great with Xbox One, Windows 10/11, and cloud gaming devices.", supplier_id: supplier1.id)

product6 = Product.create!(name: "PS5 Controller", price: 70, description: "The DualSense wireless controller offers immersive haptic feedback, dynamic adaptive triggers and a built-in microphone, all integrated into an iconic comfortable design. Compared to DUALSHOCK 4 wireless controller. Available when feature is supported by game.", supplier_id: supplier2.id)

# Product.create! - the exclamation point enables the error message for validation

Image.create!(url: "https://i5.walmartimages.com/seo/Xbox-Series-X-Video-Game-Console-Black_9f8c06f5-7953-426d-9b68-ab914839cef4.5f15be430800ce4d7c3bb5694d4ab798.jpeg", product_id: product1.id)

Image.create!(url: "https://assets-prd.ignimgs.com/2023/08/04/ps5-discounted-this-sunday-august-6-2023-1691146478074.png", product_id: product2.id)

Image.create!(url: "https://upload.wikimedia.org/wikipedia/en/b/b0/Madden_NFL_24_Cover.jpeg", product_id: product3.id)

Image.create!(url: "https://assets-prd.ignimgs.com/2022/05/24/call-of-duty-modern-warfare-2-button-02-1653417394041.jpg", product_id: product4.id)

Image.create!(url: "https://m.media-amazon.com/images/I/71y1VUWBUtS.jpg", product_id: product5.id)

Image.create!(url: "https://i.ebayimg.com/images/g/2BMAAOSwN~VkwYmb/s-l1600.jpg", product_id: product6)

Image.create!(url: "https://assets.xboxservices.com/assets/12/7e/127e5830-82cb-4f6c-beef-4f9a0c970430.jpg?n=Consoles-Hub_Content-Placement_Hub-SX_788x444.jpg", product_id: product1.id)

Image.create(url: "https://emulation.gametechwiki.com/images/thumb/6/64/Ps5.png/900px-Ps5.png", product_id: product2.id)
