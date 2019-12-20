defmodule Support.FormatAgnostic do

  @nl ~r{\n}
  defmacro test_as_html(name, markdown, html, messages \\ []) do
    status = if Enum.empty?(messages), do: :ok, else: :error
    quote do
      test unquote(name) do
        {status1, html1, messages1} = Earmark.as_html(unquote(markdown))
        html2 = Regex.replace(unquote(Macro.escape(@nl)), html1, "")
        assert {status1, html2, messages1} == {unquote(status), unquote(html), unquote(messages)}
      end
    end
  end
end
