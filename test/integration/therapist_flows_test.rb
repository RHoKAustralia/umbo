require 'test_helper'

class TherapistFlowsTest < ActionDispatch::IntegrationTest
  setup do
    @email_not_set_up = user(:NoTherapistUser).email
    @email = user(:TherapistUser).email
  end

  test "log in takes to ??? if missing" do
    log_in_and_follow(@email_not_set_up)
    # FIXME: this should probably take therapist to some set up page
    assert_redirected_to "/dashboard"
  end

  test "log in takes to dashboard" do
    log_in_and_follow(@email)
    assert_redirected_to "/dashboard"
  end

end
