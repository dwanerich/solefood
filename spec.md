Your models must:

DONE • Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

DONE • Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

DONE •Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

DONE •You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

DONE •Your application must provide standard user authentication, including signup, login, logout, and passwords.

DONE •Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

DONE •You must include and make use of a nested resource with the appropriate RESTful URLs.

 DONE • You must include a nested new route with form that relates to the parent resource

WORK IN PROGRESS • You must include a nested index or show route

DONE •Your forms should correctly display validation errors.

DONE a. Your fields should be enclosed within a fields_with_errors class

DONE b. Error messages describing the validation failures must be present within the view.

WORK IN PROGRESS Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

• Logic present in your controllers should be encapsulated as methods in your models.

• Your views should use helper methods

___________=====_________+++++

Explain the MVC framework
Model - the relationship between the objects and the database
View - A presentation of data in a particular format,
Controller - It takes care of the flow: make decisions in which format you’ll present the data

How do we access data in our views that we defined in our controllers?
by using instance methods

What is the difference between “redirect_to” and “render”
    Render tells Rails which view or asset to show a user, without losing access to any variables defined in the controller action. Redirect_to  is different. The redirect_to method tells your browser to send a request to another URL.

What methods do we get from “belongs_to”, “has_many”, “has_many, through” and “has_secure_password”?
belongs to gives you the method= of the parent such as Workout.category=, build_category/create_category, 
has many is a one to many relationship give you destroy/clear/size/find/create

How do we represent relationships between models in our tables?
t.belongs_to/t.association_id/t.reference

What are params? What are the two places they come from?
ActionController::Base GET OR POST REQUEST URL OR FORMS

What are sessions?
sessions follow the page similar to cookies so we can set the user_id to keep them logged in

What is the flow of your application? (i.e. what triggers your get routes vs post routes or patch routes or delete routes)
action/methods

How do you authenticate your users when they log in?
I use the authenticate method so I can check the truthyness of their password digest used by the bcrypt gem/has secure password

How do you validate that a username is unique?
This is done in the model using validations uniqueness true

Why do I need to check that a resource belongs to the current user in the patch and delete routes?
becasue you want to delete only if the user associated with the resource. You dont want any user to delete anybodys information.

What are URL helpers? Where do they come from?
Url helpers come from actionview in rails it creates easy way to associate a Path with a particular url

When do we typically use form_for vs. form_tag?
you use form for usually when you have a model associated with the form

How does omniauth work?

When a user makes a request (via form, link, manual change in the url), how does rails know how to handle that request?
It handles it through the associated routes if set up correctly method:

How do you validate data? When are these validations run?
I validate data through the models validations and throught the params

Why do we use a join table? What relationship are we setting up?
we use it to set up a has many through relationship that has multiple belong to. it sets up a many to many relationship. You can use the table to query one model.

How do we set up nested forms - what do these forms need to include so that we can associate the new object with the existing? (i.e. if we have the nested route: posts/1/comments/new, how do we associate the new comment with post with id of 1?)
if its nested, the params will come through with a unique id post_id, which requires it to be added as a hidden method in the form.

Are nested routes and nested forms connected in any way? How do we use a nested route to help set up our nested form?

