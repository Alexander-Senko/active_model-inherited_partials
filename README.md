## Rails partials

Rails partials are great when it comes to rendering a model. But they still seem to have inconsistencies and a room for further improvements.

Consider the following example: we have a model inheritance chain like `Message` → `Message::Text` → `Message::HTML`.

### Issue #1: your code gets WET
To render both text and HTML messages we need to define both `message/texts/text` & `message/htmls/html` partials — even when they are identical and just rendering `message.title` and `message.body`.

### Issue #2: inconsistent variable naming
In the above case we get `text` & `html` variables inside the partials, while it's just `message` for the basic `messages/message` one. You can't even copy the identical code from one partial into another!

### Issue #3: inconsistent paths
Both texts & HTML end up in `views/message`, while the basic message goes to `views/messages`. Thus we get two directories instead of one.

So, meet
# Inherited Partials

This Rails Engine brings you:

1. **Nesting** directories to respect model namespaces.
2. Consistent variable **naming** in namespaced partials.
3. **Inheritance** when a partial is missing.

It provides the above example case with the following partial paths:

```
messages/message
messages/text/message
messages/html/message
```

When a model's partial is missing, the parent's one is looked up, upto the basic one.

## Usage

No explicit code nor configuration needed, just install it!

## Installation
Add this line to your application's Gemfile:

```ruby
gem "active_model-inherited_partials"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install active_model-inherited_partials
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
