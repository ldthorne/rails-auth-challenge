# Rails Auth Challenge

Note: the order of versions in this challenge are purposely ordered from lower levels of implementation up to the conventional Rails high level abstraction. When learning a framework like Rails, most people start with the high level abstraction and work backwards. Philosophically and pedagogically, I find enormous value starting closer to first principals and building up towards the abstractions.

This challenge has you build a Rails-backed to do list app. Users can sign up and then have a single, private list to which they can add. The focus of this challenge is user authentication, rather than the to-do-ness of the app, so spend minimal time setting up the to do functionality. Pay particular attention to the "versions" below. You should be able to point to specific commits in your git history that represent the completed "release" of a certain version.

## Initial set up

1. Create an empty Rails skeleton.
2. Create a user model and migrations with username, email and password.
3. Create a task model and migrations with a description, due date and completeness, that belongs to a user. 

### Constraints

* Do not use generators for anything but migrations.

### User stories
* As a user I can sign up for a new account with a username, email and password.
* As a user I can sign in with my username, or my email, and my password. 
* As a signed-in user I can create new tasks on my personal list which only I can see. 
* As a user I can sign out. 

## Versions

Implement the above user stories with the following constraints at each release:

### v1

* Store plaintext passwords in the database
* Use cookies to store information about who is logged in (not the "session" hash)

### v2

* Use the session hash to store information about who is logged in. 

### v3

* Salt and encrypt the user's password upon creation using a one-way encryption algorithm, like BCrypt. Store the salt on the user's record in the database alongside the hashed password. 
* Re-salt and re-encrypt the plaintext password upon login and compare that with the stored hash to verify authenticity.

#### Constraints
* Do not use `has_secure_password`.
* Do not use `BCrypt::Password`
* Use `BCrypt::Engine` (or for an extra challenge, use SCrypt, which is far less documented than BCrypt)

#### Tips
[Here are the API docs](http://www.rubydoc.info/github/codahale/bcrypt-ruby/BCrypt/Engine) on `BCrypt::Engine`.

The two methods you'll need are:

* `BCrypt::Engine.generate_salt`, and
* `BCrypt::Engine.hash_secret`

These methods are the same with the [SCrypt gem](http://www.rubydoc.info/github/pbhogan/scrypt/SCrypt/Engine).

### v4

* Drop your salt column on the users table. 
* Use `BCrypt::Password` for salting, hashing and comparison. 

### v5

* Use `has_secure_password` and its associated methods for password hashing and authentication. 


## Wrap up and reflections

Once you have implemented v5 and all prior versions, compare and reflect on the differences between v5 and v1.
