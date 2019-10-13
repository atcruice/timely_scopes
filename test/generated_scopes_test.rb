require "test_helper"

class GeneratedScopesTest < ActiveSupport::TestCase
  def setup
    @date = Date.new(2019, 10, 11)
    @datetime = DateTime.new(2019, 10, 13, 0, 0, 1)
  end

  test "after excludes the given value" do
    scope = Qwer.dated_after(@date)
    assert_equal %(SELECT \"qwers\".* FROM \"qwers\" WHERE \"qwers\".\"dated_on\" > '2019-10-11'), scope.to_sql
    assert_equal 1, scope.count
    assert_includes scope, qwers(:three)

    scope = Qwer.datetimed_after(@datetime)
    assert_equal %(SELECT \"qwers\".* FROM \"qwers\" WHERE \"qwers\".\"datetimed_at\" > '2019-10-13 00:00:01'), scope.to_sql
    assert_equal 1, scope.count
    assert_includes scope, qwers(:three)
  end

  test "before excludes the given value" do
    scope = Qwer.dated_before(@date)
    assert_equal %(SELECT \"qwers\".* FROM \"qwers\" WHERE \"qwers\".\"dated_on\" < '2019-10-11'), scope.to_sql
    assert_equal 1, scope.count
    assert_includes scope, qwers(:one)

    scope = Qwer.datetimed_before(@datetime)
    assert_equal %(SELECT \"qwers\".* FROM \"qwers\" WHERE \"qwers\".\"datetimed_at\" < '2019-10-13 00:00:01'), scope.to_sql
    assert_equal 1, scope.count
    assert_includes scope, qwers(:one)
  end

  test "from includes the given value" do
    scope = Qwer.dated_from(@date)
    assert_equal %(SELECT \"qwers\".* FROM \"qwers\" WHERE \"qwers\".\"dated_on\" >= '2019-10-11'), scope.to_sql
    assert_equal 2, scope.count
    assert_includes scope, qwers(:two)
    assert_includes scope, qwers(:three)

    scope = Qwer.datetimed_from(@datetime)
    assert_equal %(SELECT \"qwers\".* FROM \"qwers\" WHERE \"qwers\".\"datetimed_at\" >= '2019-10-13 00:00:01'), scope.to_sql
    assert_equal 2, scope.count
    assert_includes scope, qwers(:two)
    assert_includes scope, qwers(:three)
  end

  test "until includes the given value" do
    scope = Qwer.dated_until(@date)
    assert_equal %(SELECT \"qwers\".* FROM \"qwers\" WHERE \"qwers\".\"dated_on\" <= '2019-10-11'), scope.to_sql
    assert_equal 2, scope.count
    assert_includes scope, qwers(:one)
    assert_includes scope, qwers(:two)

    scope = Qwer.datetimed_until(@datetime)
    assert_equal %(SELECT \"qwers\".* FROM \"qwers\" WHERE \"qwers\".\"datetimed_at\" <= '2019-10-13 00:00:01'), scope.to_sql
    assert_equal 2, scope.count
    assert_includes scope, qwers(:one)
    assert_includes scope, qwers(:two)
  end
end
