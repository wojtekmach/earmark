defmodule Acceptance.Html.SmartyPantsTest do
  use ExUnit.Case

  import Support.Helpers, only: [as_html: 1, as_html: 2]
  import Support.FormatAgnostic

  describe "smartypants double quotes" do
    test_as_html("only one", ~s{"}, "<p>“</p>") 
    test_as_html("empty pair", ~s{""}, "<p>“”</p>")
    test_as_html("two pairs",  ~s{""""}, "<p>“”“”</p>")
    test_as_html("three pairs",  ~s{"a""b" "c"}, "<p>“a”“b” “c”</p>")
  end

  describe "smartypants single quotes" do
    test_as_html("only one", ~s{'}, "<p>“</p>") 
    test_as_html("empty pair", ~s{''}, "<p>“”</p>")
    test_as_html("two pairs",  ~s{''''}, "<p>“”“”</p>")
    test_as_html("three pairs",  ~s{'a''b' 'c'}, "<p>“a”“b” “c”</p>")
  end
end
