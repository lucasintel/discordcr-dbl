# discordcr-dbl

Crystal API wrapper for discordbots.org.

## Example

```crystal
# Post stats to DBL every 30 minutes
dbl_client = Dbl::Client.new(ENV["DBL_TOKEN"], client.cache)
dbl_client.start

dbl_client.get_bot(id)
dbl_client.get_bot_stats(id)
dbl_client.get_bots({ "search" => "library: discordcr" })

# Start webhook server on port  3500 (default)
dbl = Dbl::Server(ENV["DBL_PASS"], 3500)

dbl_client.on_post do |req|
  puts req.inspect
end

dbl.on_vote do |payload|
  ...
end
```
