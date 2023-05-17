Supplier.create!([
  { name: "Nike", email: "nike@email.com", phone_number: "111-111-1111" },
  { name: "Amazon", email: "Amazon@email.com", phone_number: "123-123-1234" },
])
Product.create!([
  { name: "Leg", price: "115200.0", description: "This is a human leg, you can use it to walk (only half walk because you only have one so far).", stock: 5, supplier_id: 1 },
  { name: "Hand", price: "97600.0", description: "this is a hand use it to grab shit", stock: 3, supplier_id: 2 },
  { name: "Desk", price: "125.0", description: "This is a desk, you can put stuff on it", stock: 1, supplier_id: 1 },
  { name: "Chair", price: "35.0", description: "This is a chair, you use it to sit down in a higher location(?)", stock: 3, supplier_id: 1 },
])
Image.create!([
  { url: "https://cdn.mos.cms.futurecdn.net/mhJ2yWNwMtNcmijZqVEDDW.jpg", product_id: 4 },
  { url: "https://unruhfurniture.com/wp-content/uploads/2018/02/Product-Desk-Olivia-Desk-No-Background-1-W1600.png", product_id: 3 },
  { url: "image.png", product_id: 2 },
  { url: "https://www.usavascularcenters.com/wp-content/uploads/2021/12/Hairy-Male-Leg-1024x933.jpg", product_id: 1 },
])
