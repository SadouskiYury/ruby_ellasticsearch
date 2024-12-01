namespace :fakestore do
  task index_fakestore_data: :environment do
    require 'faraday'

    url = 'https://fakestoreapi.com/products'
    conn = Faraday.new(url)
    response = conn.get

    if response.success?
      data = JSON.parse(response.body)

      data.each do |product_data|
        Product.upsert({
          id: product_data['id'],
          title: product_data['title'],
          price: product_data['price'],
          description: product_data['description'],
          category: product_data['category'],
          image: product_data['image']
      }
        )
      end

      puts "Products imported successfully!"
    else
      puts "Failed to fetch data from API. Error: #{response.code} - #{response.body}"
    end
    
  end
end