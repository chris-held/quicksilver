# Quicksilver GraphQL API

This was an excuse for me to mess with the new template repositories feature in github. It's an absinthe graphql boilerplate with user registration and login out of the box.

To use, click the Use this template button on github to clone the repository, which will clone the repo over. Then, you'll need to rename your modules as necessary from Quicksilver to whatever you app is called. I might eventually make this into a custom mix task to eliminate that step.

This was largely based on the awesome pragmatic studios [Full Stack GraphQL](https://pragmaticstudio.com/courses/unpacked-full-stack-graphql-with-absinthe-phoenix-react) course. Highly recommend, I learned a lot.

## Installation

1. Install Elixir dependencies:

   ```sh
   mix deps.get
   ```

2. Create the database, run all the migrations, and load the sample data:

   ```sh
   mix ecto.setup
   ```

3. Fire up the Phoenix endpoint:

   ```sh
   mix phx.server
   ```

4. Visit [`localhost:4000/graphiql`](http://localhost:4000/graphiql) to explore the GraphQL API using the GraphiQL user interface.

### Sign Up

```graphql
mutation {
  signup(email: "test", email: "test@example.com", password: "password") {
    token
    user {
      id
      email
    }
  }
}
```

### Sign In

```graphql
mutation {
  signin(email: "admin@example.com", password: "password") {
    token
    user {
      id
      email
    }
  }
}
```

### Get the Currently Signed-in User

```graphql
query {
  me {
    email
  }
}
```

## App Generation

This app was generated using:

```sh
mix phx.new Quicksilver --no-html
```
