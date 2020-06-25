# README


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# solefood

SOLEFOOD APP

SOLEFOOD is an application that allows users to create an account for sneaker management system. Features include adding, editing viewing and deleting sneakers and other users should be able to comment on other users sneakers.


Getting Started:
Visit github.com/dwanerich/solefood clone the repository to your desktop. Open in your editor and run budle install.

Prerequisites:
Text Editor ie: Atom, VS Code.

Built With:
Ruby on Rails - Framework
ActiveRecord 4.2.6
SQLite
Bcrypt
OAuth

Test App:
Run rails s in your terminal and copy & paste localhost:3000 local host code into your browser.

"Welcome To Solefood!"


App Highlights:

MVC is a concept which stands for Models, Views, Controllers using the analogy of a restaurant Chef, waiter & costumer to best describe it relationship. MVC also represents a concept we know as separation of concerns.

Model Associations
User
Sneaker
Brand
Comments


:has_many && :belongs_to where Sneaker :belongs_to User && User :has_many Sneakers. 
Sneaker :belongs_to Brand. User has many Brands thru Sneakers. Brands have many users through Sneakers. right?

RakeDB:

we create tables for our models via SQLite3 and migrate & manage them via Rake gem. Models are created with their respective corresponding attributes. Our database or Model class and our controller all communicate with one another flowing information back and for creating a robust responsive web application.

Class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :password_confirmation

      t.timestamps null: false
    end
Class User < ActiveRecord::Base
end
CRUD = ["CREATE", "READ", "UPDATE", "DELETE"]
CRUD represents our four basic functions of a model . Create. Read. Update. Delete. CRUD represents our four basic functions of a model. In our App a user can create a medicine, see their medicine, update & delete.

Model < ActiveRecord::Base
for Solefood we split our controller into 3. By convention we use a main controller to inherit from Sinatra::Base and the other controllers inherit from the main controller. Note only one controller can be ran at once in our config.ru so others must be set to use.

UsersController < ApplicationController
this is where our post & gets requests for user account created.

SessionsController < ApplicationController
this controller is where our create, read, update blocks are created.

SneakersController < ApplicationController
here is where we create user login & log out controls.


VALIDATION:
has_secure_password
validates :password, presence: true
in our model class we inherit macros from brypt for security and validation. In our app we used the secure password and unique username as a way to control bad data coming into our base.


At at point user can delete their sneaker, edit name, size too.”


Contributing:
Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.

Author:
Dwane Richards

License:
This project is licensed under the MIT License - see the LICENSE.md file for details

Acknowledgments:
Hat tip to my Flatiron School technical lead Annabel Wilmerding, career coach Andrew Della Rocca, all the TA's & my 12/9 Pryercracker cohort.
