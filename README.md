# README

The simpleast app with integarted elastic search as a example

Things you may want to cover:

* Ruby version
3.2.2
* System dependencies


* Database creation (postgress)
    bundle exec rails db:prepare
* How to run the test suite
    service elasticsearch start
    service kibana start
    service logstash start
    bundle exec rails s -b 0.0.0.0 -p 3001

* Configuration Elastic Seatrch
    1. Fetch the product dataset from the Fakestore API and populate it in Elasticsearch.
    ```
    bundle exec rails fakestore:index_fakestore_data
    ```
    2. Create an Elasticsearch index associated with your Product model. Before performing this task, make sure your Elasticsearch UI is live. This tool can be accessed on port 3000
    2.1
        ```
        bundle exec rails c
        Product.__elasticsearch__.create_index!
        Product.import
        ```
    2.2
        Open the Elasticsearch homepage and do the following steps to include the available data:
        a. Click the “Add integrations” button to route to the Elasticsearch homepage.
        b. Go to the “Management > Stack Management” section using the left navigation panel.
        c. Go to the “Kibana > Index Patterns” section and click the “Create index pattern” button.
        d. Type products in the “Name” field. It’ll automatically match the Elasticsearch products index. Select any option in the “Timestamp” field. Click the “Create index pattern” button to create the index pattern.
        e.Testing Elasticsearch
          1. Go to the “Management > Dev Tools” section using the left navigation panel.
          2. Open the “Console” tab to write the queries.
          3. Run the following query to fetch all of the products:
            ```
            GET /products/_search
            {
            "query": {
                "match_all": {}
            }
            }
            ```
    2.3.To verify if the data has been loaded, run Product.all in the Rails console
    2.4. Open browser tab with port 3001 and check the search bar is working