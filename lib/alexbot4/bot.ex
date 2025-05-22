 AlexBot 4 - Elixir Discord Moderation Bot (Core Structure)
# Dependencies: :nostrum, :timex

# mix.exs should include:
# {:nostrum, ">= 0.5.0"},
# {:timex, ">= 3.7.8"}

# lib/alexbot4/bot.ex

defmodule AlexBot4.Bot do
  use Nostrum.Consumer

  alias Nostrum.Api
  alias Nostrum.Struct.{Message, Guild, User}

  require Logger

  def start_link, do: Consumer.start_link(__MODULE__)

  def handle_event({:MESSAGE_CREATE, msg, _ws}) do
    if msg.author.bot, do: :ignore, else: handle_message(msg)
  end

  defp handle_message(%Message{content: content} = msg) do
    cond do
      content == "/;START:" -> AlexBot4.Commands.handle_start(msg)
      content == "/:o;]" -> AlexBot4.Commands.handle_owner_superban(msg)
      content == ";func()" -> AlexBot4.Commands.handle_func_purge(msg)
      String.starts_with?(content, ";translate ") -> AlexBot4.Commands.handle_translation(msg)
      AlexBot4.Detectors.japanese_bible?(msg.content) -> Api.create_message(msg.channel_id, "Bru.")
      true ->
        AlexBot4.SpeedyAgreementoring.check_trigger(msg)
        :ok
    end
  end
end
