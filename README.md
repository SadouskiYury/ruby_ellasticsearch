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
    1. In this task, you'll fetch the product dataset from the Fakestore API and populate it in Elasticsearch.
    ```
    bundle exec rails fakestore:index_fakestore_data
    ```
    2. In this task, you’ll create an Elasticsearch index associated with your Product model. Before performing this task, make sure your Elasticsearch UI is live. This tool can be accessed on port 3000
      a.
        ```
        bundle exec rails c
        Product.__elasticsearch__.create_index!
        Product.import
        ```
      b.
        Open the Elasticsearch homepage and do the following steps to include the available data:
        1. Click the “Add integrations” button to route to the Elasticsearch homepage.
        2. Go to the “Management > Stack Management” section using the left navigation panel.
        3. Go to the “Kibana > Index Patterns” section and click the “Create index pattern” button.
        4. Type products in the “Name” field. It’ll automatically match the Elasticsearch products index. Select any option in the “Timestamp” field. Click the “Create index pattern” button to create the index pattern.
      c.To verify if the data has been loaded, run Product.all in the Rails console
      d. Open browser tab with port 3001 and check the search bar is working