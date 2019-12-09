namespace(:dev) do
  desc "Hydrate the database with some dummy data to look at so that developing is easier"
  task({ :prime => :environment}) do
    User.destroy_all
    Book.destroy_all
    Bidding.destroy_all

    u =User.new
    u.email = "reem@hotmail.com"
    u.password = "password"
    u.password_confirmation = "password"
    u.username = "reem"
    u.phone_number = "+111"
    u.address = "Chicago"
    u.save 

    u =User.new
    u.email = "rana@hotmail.com"
    u.password = "password"
    u.password_confirmation = "password"
    u.username = "rana"
    u.phone_number = "+222"
    u.address = "Saudi"
    u.save 

    u =User.new
    u.email = "dalia@hotmail.com"
    u.password = "password"
    u.password_confirmation = "password"
    u.username = "dalia"
    u.phone_number = "+333"
    u.address = "Urbana"
    u.save 

    u =User.new
    u.email = "razan@hotmail.com"
    u.password = "password"
    u.password_confirmation = "password"
    u.username = "razan"
    u.phone_number = "+444"
    u.address = "Dubai"
    u.save 

    b = Book.new 
    b.owner_id = 20
    b.title = "The Hobbit"
    b.price = 6
    b.image = "https://images-na.ssl-images-amazon.com/images/I/91b0C2YNSrL.jpg"
    b.availability = true 
    b.author = "J.R.R. Tolkien"
    b.save

    b = Book.new 
    b.owner_id = 21
    b.title = "The Fault in Our Stars"
    b.price = 7
    b.image = "https://images-na.ssl-images-amazon.com/images/I/81a4kCNuH%2BL.jpg"
    b.availability = true 
    b.author = "John Green"
    b.save

    d = Bidding.new 
    d.bidder_id = 21 
    d.book_id = 9
    d.bidding_amount = 6.5
    d.save

    d = Bidding.new 
    d.bidder_id = 20 
    d.book_id = 8
    d.bidding_amount = 8
    d.save


  end
end
