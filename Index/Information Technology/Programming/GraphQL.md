- **Links**
	- [GraphQL Caching](GraphQL%20Caching.md)
	- [Introduction to GraphQL](https://graphql.org/learn/)	
	- [apollographql/apollo-client:  A fully-featured, production ready caching GraphQL client for every UI framework and GraphQL server.](https://github.com/apollographql/apollo-client)
- [SwiftUI](SwiftUI.md)
	- [nerdsupremacist/Graphaello: A Tool for Writing Declarative, Type-Safe and Data-Driven Applications in SwiftUI using GraphQL](https://github.com/nerdsupremacist/Graphaello)

## Variables

```graphql
# declare variable in operation name
query HeroNameAndFriends($episode: Episode) {
	# use variable
  hero(episode: $episode) { ... }
}

# variable can have default value
query HeroNameAndFriends($episode: Episode = JEDI) { ... }
```

![[GraphQL/Untitled.png]]

## Types

### Schema

```graphql
# schena declaration
schema {
  query: Query
  mutation: Mutation
}

# all supported queries decalration
type Query {
  hero(episode: Episode): Character
  droid(id: ID!): Droid
}
```

### Scalars

```graphql
String # Scalar type (Optional)

String! # Scalar type (Required, Non-nullable)

scalar Date # define own scalar type

# enum type, kinda scalar
enum Episode {
  NEWHOPE
  EMPIRE
  JEDI
}
```

### Lists

```graphql
myField: [String!] # list is not required and can't contains nulls

myField: null # valid
myField: [] # valid
myField: ['a', 'b'] # valid
myField: ['a', null, 'b'] # error
```

```graphql
myField: [String]! # list is required and can contains nulls

myField: null // error
myField: [] // valid
myField: ['a', 'b'] // valid
myField: ['a', null, 'b'] // valid
```

### Objects

```graphql
# Object type defined in schema
type Character {
  name: String!
  appearsIn: [Episode!]!
	length(unit: LengthUnit = METER): Float # unit can be optional here because we provided default value
}
```

### Interfaces

To include type exclusive field in operation use [[#Inline fragments]]

```graphql
interface Character {
  id: ID!
  name: String!
  friends: [Character]
  appearsIn: [Episode]!
}

type Human implements Character {
  id: ID!
  name: String!
  friends: [Character]
  appearsIn: [Episode]!
  starships: [Starship]
  totalCredits: Int # add more fields
}
 
type Droid implements Character {
  id: ID!
  name: String!
  friends: [Character]
  appearsIn: [Episode]!
  primaryFunction: String
}
```

### Unions

Members of a union type need to be concrete object types, not interfaces nor unions

```graphql
union SearchResult = Human | Droid | Starship
```

Fetch of union type requires to use [[#Inline fragments]]

## Inputs

```graphql
# to pass complex object in mutation 
input ReviewInput {
  stars: Int!
  commentary: String
}
```

The fields on an input object type can themselves refer to input object types

You can't mix input and output types in your schema

```graphql
mutation CreateReviewForEpisode($ep: Episode!, $review: ReviewInput!) {
  createReview(episode: $ep, review: $review) {
    stars
    commentary
  }
}
############################################################
# VARIABLES
{
  "ep": "JEDI",
  "review": {
    "stars": 5,
    "commentary": "This is a great movie!"
  }
}
```

## Operations

While query fields are executed in parallel, mutation fields run in series, one after the other.

Operations constructed from `operation type` and `operation name`, for exampe

```graphql
query Kek {
	lol
}
```

`query` - operation type

`Kek` - operation name

### `query`

Shorthand syntax allowed only for queries

For exmple [Apollo](https://www.apollographql.com/) do not allow queries with no operation name. 

```graphql
# query with operation name
query StorySharesInfo($id: String!) {
  story(id: $id) {
    guid
  }
}

# query shorhand syntax
{
  story(id: "5f0d8593-756d-4650-a302-812e02b8c097") {
    guid
  }
}

# When querying object we need to specify at least one filed. 
# `story` query returning Story object
{ 
	#error
	story(id: "5f0d8593-756d-4650-a302-812e02b8c097") {

  }
	
	#error
	story(id: "5f0d8593-756d-4650-a302-812e02b8c097")

	# ok
	story(id: "5f0d8593-756d-4650-a302-812e02b8c097") {
    guid
  }
}
```

### `mutation`

Mutatate something on server and at the same time fetch 

```graphql
mutation CreateReviewForEpisode($ep: Episode!, $review: ReviewInput!) {
  createReview(episode: $ep, review: $review) {
		# mutation returning Review object and immideatly fetch needed fields
    stars
    commentary
  }
}
```

```json
{
  "data": {
    "createReview": {
      "stars": 5,
      "commentary": "This is a great movie!"
    }
  }
}
```

### `subscription`

TODO

## Meta fields

### `__typename`

Get access to schema types to make some decisions on client.

```graphql
search(text: "an") {
    __typename
    ... on Human {
      name
    }
    ... on Droid {
      name
    }
    ... on Starship {
      name
    }
  }
}
```

```json
{
  "data": {
    "search": [
      {
        "__typename": "Human",
        "name": "Han Solo"
      },
      {
        "__typename": "Human",
        "name": "Leia Organa"
      },
      {
        "__typename": "Starship",
        "name": "TIE Advanced x1"
      }
    ]
  }
}
```

## Aliases

We can give names to data on client side to make everything more verbose

```graphql
{
  empireHero: hero(episode: EMPIRE) {
    name
  }
  jediHero: hero(episode: JEDI) {
    name
  }
}
```

```json
{
  "data": {
    "empireHero": {
      "name": "Luke Skywalker"
    },
    "jediHero": {
      "name": "R2-D2"
    }
  }
}
```

## Fragments

To repeat some set of fields automaticly.

```graphql
{
  leftComparison: hero(episode: EMPIRE) {
    ...comparisonFields
  }
  rightComparison: hero(episode: JEDI) {
    ...comparisonFields
  }
}

fragment comparisonFields on Character {
  name
  appearsIn
  friends {
    name
  }
}
```

```json
{
  "data": {
    "leftComparison": {
      "name": "Luke Skywalker",
      "appearsIn": [
        "NEWHOPE",
        "EMPIRE",
        "JEDI"
      ],
      "friends": [
        {
          "name": "Han Solo"
        },
        {
          "name": "Leia Organa"
        },
        {
          "name": "C-3PO"
        },
        {
          "name": "R2-D2"
        }
      ]
    },
    "rightComparison": {
      "name": "R2-D2",
      "appearsIn": [
        "NEWHOPE",
        "EMPIRE",
        "JEDI"
      ],
      "friends": [
        {
          "name": "Luke Skywalker"
        },
        {
          "name": "Han Solo"
        },
        {
          "name": "Leia Organa"
        }
      ]
    }
  }
}
```

### Variables in fragments

```graphql
query HeroComparison($first: Int = 3) {
  leftComparison: hero(episode: EMPIRE) {
    ...comparisonFields
  }
  rightComparison: hero(episode: JEDI) {
    ...comparisonFields
  }
}

fragment comparisonFields on Character {
  name
  friendsConnection(first: $first) {
    totalCount
    edges {
      node {
        name
      }
    }
  }
}
```

```json
{
  "data": {
    "leftComparison": {
      "name": "Luke Skywalker",
      "friendsConnection": {
        "totalCount": 4,
        "edges": [
          {
            "node": {
              "name": "Han Solo"
            }
          },
          {
            "node": {
              "name": "Leia Organa"
            }
          },
          {
            "node": {
              "name": "C-3PO"
            }
          }
        ]
      }
    },
	...
```

### Inline fragments

```graphql
query HeroForEpisode($ep: Episode!) {
  hero(episode: $ep) {
    name
		# for Droid type return this filds
    ... on Droid {
      primaryFunction
    }
		# for Human type return this fields
    ... on Human {
      height
    }
  }
}
```

## Directives

Default GraphQL provided directives:

- `@include(if: Boolean)`: Only include this field in the result if the argument is true.
- `@skip(if: Boolean)`: Skip this field if the argument is true

```graphql
query Hero($episode: Episode, $withFriends: Boolean!) {
  hero(episode: $episode) {
    name
		# friends only will be included if withFriends == true
    friends @include(if: $withFriends) {
      name
    }
  }
}
```