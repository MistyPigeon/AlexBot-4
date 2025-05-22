defmodule AlexBot4.Translate do
  def decode_morse(morse) do
    morse_map = %{"...." => "H", "." => "E", "-.--" => "Y"} # etc.
    morse |> String.split(" ") |> Enum.map(&Map.get(morse_map, &1, "?")) |> Enum.join("")
  end
end
