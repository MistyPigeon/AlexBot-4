defmodule AlexBot4.Detectors do
  def japanese_bible?(text) do
    String.length(text) > 100_000 and
    String.contains?(text, ["はじめに", "神", "イエス"])
  end
end
