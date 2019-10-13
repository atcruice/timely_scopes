require "test_helper"

class AddTimelyScopesTest < ActiveSupport::TestCase
  test "add_timely_scopes after accepts date column" do
    refute_respond_to Asdf, :dated_after
    Asdf.add_timely_scopes(:dated_after)
    assert_respond_to Asdf, :dated_after
  end

  test "add_timely_scopes before accepts date column" do
    refute_respond_to Asdf, :dated_before
    Asdf.add_timely_scopes(:dated_before)
    assert_respond_to Asdf, :dated_before
  end

  test "add_timely_scopes from accepts date column" do
    refute_respond_to Asdf, :dated_from
    Asdf.add_timely_scopes(:dated_from)
    assert_respond_to Asdf, :dated_from
  end

  test "add_timely_scopes until accepts date column" do
    refute_respond_to Asdf, :dated_until
    Asdf.add_timely_scopes(:dated_until)
    assert_respond_to Asdf, :dated_until
  end

  test "add_timely_scopes after accepts datetime column" do
    refute_respond_to Asdf, :datetimed_after
    Asdf.add_timely_scopes(:datetimed_after)
    assert_respond_to Asdf, :datetimed_after
  end

  test "add_timely_scopes before accepts datetime column" do
    refute_respond_to Asdf, :datetimed_before
    Asdf.add_timely_scopes(:datetimed_before)
    assert_respond_to Asdf, :datetimed_before
  end

  test "add_timely_scopes from accepts datetime column" do
    refute_respond_to Asdf, :datetimed_from
    Asdf.add_timely_scopes(:datetimed_from)
    assert_respond_to Asdf, :datetimed_from
  end

  test "add_timely_scopes until accepts datetime column" do
    refute_respond_to Asdf, :datetimed_until
    Asdf.add_timely_scopes(:datetimed_until)
    assert_respond_to Asdf, :datetimed_until
  end

  test "add_timely_scopes fails given ambiguous column" do
    error = assert_raises(TimelyScopes::AmbiguousColumnError) do
      Asdf.add_timely_scopes(:date_after)
    end

    assert_equal ":date_after matched multiple columns: dated_on and datetimed_at", error.message
  end

  test "add_timely_scopes fails given unsupported column" do
    error = assert_raises(TimelyScopes::UnsupportedColumnError) do
      Asdf.add_timely_scopes(:bool_after)
    end

    assert_equal "column type :boolean not supported", error.message
  end

  test "add_timely_scopes fails when no column matched" do
    error = assert_raises(TimelyScopes::NoColumnError) do
      Asdf.add_timely_scopes(:doted_after)
    end

    assert_equal "\"doted\" does not match the start of any column names", error.message
  end

  test "add_timely_scopes fails given bad argument" do
    error = assert_raises(TimelyScopes::ArgumentFormatError) do
      Asdf.add_timely_scopes(:dated_form)
    end

    assert_equal ":dated_form does not match expected format", error.message
  end
end
