require "test_helper"

class TestMailerTest < ActionMailer::TestCase
  test "test_email" do
    mail = TestMailer.test_email
    assert_equal "Test email", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
