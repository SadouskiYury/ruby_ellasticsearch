class Product < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings index: { number_of_shards: 1 } do
        mappings dynamic: 'false' do
          indexes :title, analyzer: 'english', index_options: 'offsets'
          indexes :description, analyzer: 'english'
          indexes :category, type: 'keyword'
          indexes :price, type: 'float'
        end
    end
end
