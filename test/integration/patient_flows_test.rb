require 'test_helper'

class PatientFlowsTest < ActionDispatch::IntegrationTest
  setup do
    # email of a patient that doesn't have patient object set up
    @email_no_patient = 'not.set.up@patients.com'

    # email of a patient that doesn't have any therapists
    @email_no_therapist = 'looking4therapist@patients.com'

    # full blown patient user's email
    @email = 'patient@patients.com'
  end

  test "login takes to patient creation if missing" do
    log_in_and_follow(@email_no_patient)
    assert_redirected_to "/patients/new"
  end

  test "login takes to therapist selection if missing" do
    log_in_and_follow(@email_no_therapist)
    assert_redirected_to "/search"
  end

  # TODO: add a test for user logging in with @email once that handling is in

end
