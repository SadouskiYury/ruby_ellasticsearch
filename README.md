# README

# Simple Elasticsearch Application Example

This is a basic Ruby on Rails application integrated with Elasticsearch, showcasing its functionality for data indexing and search capabilities.

---

## **Ruby Version**
- `3.2.2`

---

## **System Dependencies**
- Sqlite3
- Elasticsearch
- Kibana
- Logstash

---

## **Setup Instructions**

### **Step 1: Database Setup**
Prepare the database using:
```bash
bundle exec rails db:create
bundle exec rails db:migrate
```

### **Step 2: Running the Application**
```bash
    service elasticsearch start
    service kibana start
    bundle exec rails s -b 0.0.0.0 -p 3001
```

### **Step 3: Configuration Elastic Search**

1. Fetch the product dataset from the Fakestore API and populate it in Elasticsearch.

    ```
    bundle exec rails fakestore:index_fakestore_data
    ```

2. Create an Elasticsearch index associated with your Product model. Before performing this task, make sure your Elasticsearch UI is live. This tool can be accessed on port 3000
   ###### 2.1
    ```
    bundle exec rails c
    Product.__elasticsearch__.create_index!
    Product.import
    ```
   ###### 2.2
       Open the Elasticsearch homepage and do the following steps to include the available data:
       a. Click the “Add integrations” button to route to the Elasticsearch homepage.
       b. Go to the “Management > Stack Management” section using the left navigation panel.
       c. Go to the “Kibana > Index Patterns” section and click the “Create index pattern” button.
       d. Type products in the “Name” field. It’ll automatically match the Elasticsearch products index. Select any option in the “Timestamp” field. Click the “Create index pattern” button to create the index pattern.
   ###### 2.3.Testing Elasticsearch
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
   ###### 2.4.
    **Create a Bar Chart**

     a. Go to the “Analytics > Visualize Library” section using the left navigation panel.
    
    b. Click the “Create new visualization” button to create your first visualization.
     
    c. Click the “Lens” card from the “New visualization” modal.

    d. The “Bar vertical stacked” option is already selected by default in the “visualization type” section. You can click it to select any other bar cart of your choice.
     
    e. Drag and drop the category.keyword field available under the “Available fields” section in the central section where “Drop some fields here to start” is displayed to create the bar chart.
