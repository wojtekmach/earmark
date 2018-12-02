defmodule Earmark.VersionTest do
  use ExUnit.Case
  test "version" do
    assert Regex.match?(~r{\A\d+\.\d+\.\d+}, Earmark.version()|>to_string())
  end
end
