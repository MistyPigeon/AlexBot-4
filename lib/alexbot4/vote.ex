efmodule AlexBot4.Vote do
  alias Nostrum.Api

  @vote_timeout 30_000

  def start(:speedy_agreementoring, guild_id, target_id, channel_id) do
    Api.create_message(channel_id, "⚖️ Speedy Agreementoring vote started for <@#{target_id}>. Staff vote with !agree or !skip (30 sec)")
    votes = %{agree: [], skip: []}

    spawn(fn -> collect_votes(votes, guild_id, target_id, channel_id) end)
  end

  defp collect_votes(votes, guild_id, target_id, channel_id) do
    Process.sleep(@vote_timeout)

    # Mocked vote result (replace with real vote count logic)
    result = Map.get(votes, :agree) |> length()

    if result >= 6 do
      Nostrum.Api.create_guild_ban(guild_id, target_id)
      Api.create_message(channel_id, "✅ User <@#{target_id}> banned after vote.")
    else
      Api.create_message(channel_id, "❌ Vote failed. No action taken.")
    end
  end
end
