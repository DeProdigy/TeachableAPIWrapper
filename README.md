## TeachableAPIWrapper

Simple API wrapper for [Teachable Mock API](https://fast-bayou-75985.herokuapp.com/).

## Uses

#### Users

######  Authenticate
To authenticate the user:

`TeachableAPIWrapper::Users.authenticate(email, password)`

######  Registration
To register the user:

`TeachableAPIWrapper::Users.register(email, password, password_confirmation)`


######  Current User
To retrieve the current user data:

`TeachableAPIWrapper::Users.user_info(email, auth_token)`


#### Orders

######  All
To receive all of the order data:

`TeachableAPIWrapper::Orders.all(email, auth_token)`

######  Create
To create an order:

`TeachableAPIWrapper::Orders.create(email, total, total_quantity, special_instructions, auth_token)`

######  Delete
To delete an order:

`TeachableAPIWrapper::Orders.delete(id, email, auth_token)`


## Setup
`$ bundle install`

## Tests
`$ rspec spec`

## Possible Improvements
* Create a instance "Client" that contains user information to minimize the number of passed in params
* Refine specs to test the method calls with the exact data
* Wrap the `TeachableAPIWrapper` in a gem

#### Sample curls for the API
```
curl -X POST -d '{ "user": { "email": "dev-1200222@example.com", "password": "password", "password_confirmation": "password" }}' https://fast-bayou-75985.herokuapp.com/users.json -i -H "Accept: application/json" -H "Content-Type: application/json"

curl -X POST -d '{ "user": { "email": "dev-8@example.com", "password": "password" }}' https://fast-bayou-75985.herokuapp.com/users/sign_in.json -i -H "Accept: application/json" -H "Content-Type: application/json"

curl -X GET 'https://fast-bayou-75985.herokuapp.com/api/users/current_user/edit.json?user_email=dev-8@example.com&user_token=qC3v3HvBfKxCQuyqu49g' --header "Content-Type:application/json"

curl -X GET 'https://fast-bayou-75985.herokuapp.com/api/orders.json?user_email=dev-8@example.com&user_token=qC3v3HvBfKxCQuyqu49g' --header "Content-Type:application/json"

curl -X POST -d '{ "order": { "total": "3.00", "total_quantity": "3", "email": "dev-8@example.com", "special_instructions": "special instructions foo bar" } }' 'https://fast-bayou-75985.herokuapp.com/api/orders.json?user_email=dev-8@example.com&user_token=qC3v3HvBfKxCQuyqu49g' -i -H "Accept: application/json" -H "Content-Type: application/json"

curl -X DELETE 'https://fast-bayou-75985.herokuapp.com/api/orders/362.json?user_email=dev-8@example.com&user_token=qC3v3HvBfKxCQuyqu49g' -i -H "Accept: application/json" -H "Content-Type: application/json"
```
