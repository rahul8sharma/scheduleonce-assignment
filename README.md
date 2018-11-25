# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.2.5

* Rails version: 5.1.6

* Clone the repo

* Go to project directory

* Write 'bundle install' and press enter

* Write 'rails s' to start rails server

* Run all test cases: bin/rails test test

* Run specific test case: bin/rails test test/controllers/invoice_controller_test.rb

* How does an Active Record work? 
* Anser: ActiveRecord is an ORM. It’s a layer of Ruby code that runs between your database and your logic code.
	Well when we run the rails generate model command we call the model_generator.rb file in rails specifically to this two methods

	creates the migration file for the model.
	```
	def create_migration_file
	  return unless options[:migration] &amp;&amp; options[:parent].nil?
	  attributes.each { |a| a.attr_options.delete(:index) if a.reference?
	        &amp;&amp; !a.has_index? } if options[:indexes] == false
	  migration_template "../../migration/templates/create_table_migration.rb",
	        File.join(db_migrate_path, "create_#{table_name}.rb")
	end

	def create_model_file
	  template "model.rb", File.join("app/models", class_path, "#{file_name}.rb")
	end
	```

	The first method creates the migration file that we saw before and the second method creates the Model file.

	Now that we have our Model and our migration file we have to do one more thing: we have to run rake db:migrate. This will run our migration file and a table will be created in the database.

	We are ready for the next step to use this model we just created.

	Suppose, I will take the example of 'save' the record. The save method runs an SQL query command inside the abstract adapters we have this method.

	```
	def insert(arel, name = nil, pk = nil, id_value = nil, sequence_name = nil, binds = [])
	  sql, binds = to_sql_and_binds(arel, binds)
	    value = exec_insert(sql, name, binds, pk, sequence_name)
	    id_value || last_inserted_id(value)
	  end
	```

* ...
