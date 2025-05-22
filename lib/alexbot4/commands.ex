defmodule AlexBot4.Commands do
  alias Nostrum.Api

  def handle_start(msg) do
    if AlexBot4.Util.is_staff?(msg), do: Api.create_message(msg.channel_id, "AlexBot 4 activated."), else: :ignore
  end

  def handle_owner_superban(msg) do
    if AlexBot4.Util.is_owner?(msg), do: Api.create_message(msg.channel_id, "Owner superban mode. Type who to ban."), else: :ignore
  end

  def handle_func_purge(msg) do
    if AlexBot4.Util.is_staff?(msg) do
      users = AlexBot4.WarnStore.get_users_with_1_to_3_warnings(msg.guild_id)
      Enum.each(users, fn user_id ->
        Api.create_guild_ban(msg.guild_id, user_id)
      end)
      Api.create_message(msg.channel_id, "All users with 1-3 warnings banned.")
    end
  end

  def handle_translation(msg) do
    # Assume it’s like: ;translate morse decode "..."
    parts = String.split(msg.content, " ")
    case parts do
      [";translate", "morse", "decode", text] -> decoded = AlexBot4.Translate.decode_morse(text)
      _ -> Api.create_message(msg.channel_id, "Invalid translate command.")
    end
  end
end
