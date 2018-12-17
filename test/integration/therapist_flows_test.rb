require 'test_helper'

class TherapistFlowsTest < ActionDispatch::IntegrationTest
  setup do
    @email_not_set_up = user(:NoTherapistUser).email
    @email = user(:TherapistUser).email
  end

  test "log in takes to new therapist profile page if missing" do
    log_in_and_follow(@email_not_set_up)
    assert_redirected_to new_therapist_path
  end

  test "log in takes to dashboard" do
    log_in_and_follow(@email)
    assert_redirected_to dashboard_path
  end

end
