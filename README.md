# fixjour 2 (to be renamed)

A small factory library for Rails apps.

## Usage

```ruby
require 'fixjour'

Fixjour do
  define User do |user|
    user.name = "Pat"
  end

  define Article do |article|
    article.user = new_user
    article.title = "This is a good one"
  end
end
```

You'll get some methods:

```ruby
include Fixjour

unsaved_user = new_user(name: "Pat")
saved_user = create_user(name: "Pat")
```

### Counters

Sometimes you need to make sure attributes are unique. You can use counters for those:

```ruby
Fixjour do
  define User do |user|
    i = counter(:users)
    user.email = "user-#{i}@example.com"
  end
end
```

Counters each start at 1 and increment every time you call `counter(:some_argument)`.


(c) Copyright 2011-2018 Pat Nakajima. All Rights Reserved. 
