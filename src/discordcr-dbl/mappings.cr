module Dbl
  module UInt64Converter
    def self.from_json(value : JSON::PullParser) : UInt64
      value.read_string.to_u64
    end
  end

  struct Vote
    JSON.mapping(
      bot: {type: UInt64, converter: UInt64Converter},
      user: {type: UInt64, converter: UInt64Converter},
      isWeekend: Bool,
      type: String
    )
  end

  struct Bot
    JSON.mapping(
      id: {type: UInt64, converter: UInt64Converter},
      username: String,
      discriminator: String,
      avatar: String?,
      defAvatar: String,
      lib: String,
      prefix: String,
      shortdesc: String,
      longdesc: String?,
      tags: Array(String),
      website: String?,
      support: String?,
      github: String?,
      owners: Array(String),
      invite: String?,
      date: Time,
      certifiedBot: Bool,
      vanity: String?,
      points: UInt64
    )
  end

  struct Stats
    JSON.mapping(
      server_count: UInt64?,
      shards: Array(UInt64),
      shards_count: UInt64?
    )
  end
end
