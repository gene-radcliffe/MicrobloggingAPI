# Tudor
Tudor is what was happening in England/Scotland/Ireland and what people were talking about 1,000 years ago.

## API
### End Points
#### Index of Users
GET	/api/v1/users

#### Create New User
POST	/api/v1/users
To create a new user account, send a POST request to /api/v1/users.  This action requires username and password parameters, and will return a full account record if complete. 

#### Retrieve Authentication Token
POST	/api/v1/session
To retrieve your authentication token, send a POST request to /api/v1/session.  This action requires username and password parameters.

#### Create New Comment on a Proclamation
POST	/api/v1/proclamations/:proclamation_id/comments
This action requires token authentication.  Include a valid authentication token in your request header associated to the Authorization key.

#### Index of Proclamations
GET	/api/v1/proclamations

#### Create New Proclamation
POST	/api/v1/proclamations
This action requires token authentication.  Include a valid authentication token in your request header associated to the Authorization key.

#### Show Proclamation and Comments
GET	/api/v1/proclamations/:id

#### Delete Proclamation
DELETE	/api/v1/proclamations/:id
This action requires token authentication.  Include a valid authentication token in your request header associated to the Authorization key.

## Build a Microblogging API

## Description

For this group project, you will work in pairs to build an api-only application that provides data to a service like Twitter. The application will allow users to create and share short posts and comment on posts.

The API will respond with JSON data to HTTP requests sent from a client.

_Yes, the posts are tweets. But please find another name to call them in your app._

## Project details

Design your API to support a service like Twitter, allowing users to create and share microposts and to favorite other users' microposts.

Begin by thinking about the resources that you need to create. If a front-end team wanted to recreate Twitter, what data would they need from you in order to do it?

Map the endpoints your application will expose, decide which will require authentication, and design the data structures you will return. You'll use jBuilder to create custom json for your data.

Please provide documentation for how to use your API in your project's README. In the documentation, you should list the available endpoints and any query parameters you can accept. Think about the documentation that's been helpful to you, and include any information that will make it easier to consume your api (for your fellow developers!).

Your API will also need to implement token authentication. You can use Rails' built-in support for HTTP token authentication and  the `has_secure_token` macro.

### Requirements

- Users should have a `username`, a `password_digest`, and any other info you think a user should have.
- Users should be able to register for an account and be authenticated.
- Posts have a text body and belong to a user.
- Your application should have seed data to populate the database with 100 users and 150-200 posts. You are welcome to use the Faker gem for this.
- Only authenticated users can create or delete posts.
  - Posts are not editable. They can only be created or destroyed.
  - Only the user that created a post should be able to delete it.
- Posts should not be valid if they are less than 2 characters or greater than 280 characters. Although a client-side application would likely show validations in the UI to prevent invalid submissions, this validation should exist on the model to ensure that only valid data is persisted to the database.
- Any user should have the ability to "follow" other users.
  - Your application should have an authenticated endpoint that returns a list of users that the current user is following and an endpoint that will return all the posts from any single user that the current user follows.
  - You might find it useful to use the [`acts_as_follower` gem](https://github.com/tcocca/acts_as_follower), but if you would rather roll your own, have at it.

### Extra challenges

- Add the ability to re-post another user's posts.
- Add the ability to "unfollow" users you have followed.
- Create a new type of user: an admin user. This admin user should be allowed to edit anybody's posts or user accounts.
  - No one should be able to create an admin user through the API (it will have to be created from the rails console), but you should be able to authenticate an admin user.
