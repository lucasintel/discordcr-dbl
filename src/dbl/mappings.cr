module Dbl
  struct Payload
    JSON.mapping(
      bot: UInt64,
      user: UInt64,
      isWeekend: Bool,
      type: String
    )
  end
end
