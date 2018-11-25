module Dbl
  struct Payload
    JSON.mapping(
      bot: UInt64,
      user: UInt64,
      isWeekend: Bool,
      type: String
    )
  end

  struct Bot
    JSON.mapping(
      id: String,
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
