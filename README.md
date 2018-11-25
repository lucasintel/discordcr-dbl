# DBL Crystal Library (WIP)

Crystal API wrapper for discordbots.org.

## Example

```crystal
dbl_stats = Dbl::Client.new(ENV["DBL_TOKEN"], client)
dbl = Dbl::Server(ENV["DBL_PASS"])

dbl.on_vote do |payload|
  ...
end
```
