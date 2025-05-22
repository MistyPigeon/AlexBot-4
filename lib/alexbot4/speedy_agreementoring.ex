defmodule AlexBot4.SpeedyAgreementoring do
  alias Nostrum.Api
  import Timex

  def check_trigger(msg) do
    user_id = msg.author.id
    guild_id = msg.guild_id

    if AlexBot4.Evidence.count(user_id) >= 6 and
       AlexBot4.BanHistory.count(user_id) >= 1 and
       AlexBot4.WarnStore.two_today?(guild_id, user_id) do

      # Trigger voting
      AlexBot4.Vote.start(:speedy_agreementoring, guild_id, user_id, msg.channel_id)
    end
  end
end
