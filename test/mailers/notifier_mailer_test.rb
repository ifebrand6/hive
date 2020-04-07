require 'test_helper'

class NotifierMailerTest < ActionMailer::TestCase
  test "send_accepted_expert_mail" do
    mail = NotifierMailer.send_accepted_expert_mail
    assert_equal "Send accepted expert mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "send_mail_for_a_talent_request" do
    mail = NotifierMailer.send_mail_for_a_talent_request
    assert_equal "Send mail for a talent request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "send_final_request_mail" do
    mail = NotifierMailer.send_final_request_mail
    assert_equal "Send final request mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "send_mail_for_a_completed_transcation" do
    mail = NotifierMailer.send_mail_for_a_completed_transcation
    assert_equal "Send mail for a completed transcation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
