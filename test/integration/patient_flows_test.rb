require 'test_helper'

class PatientFlowsTest < ActionDispatch::IntegrationTest
  setup do
    # email of a patient that doesn't have patient object set up
    @email_no_patient = user(:NoPatientPatientUser).email

    # email of a patient that doesn't have any therapists
    @email_no_therapist = user(:NoTherapistPatientUser).email

    # full blown patient user's email
    @email = user(:PatientUser).email
  end

  test "login takes to patient creation if missing" do
    log_in_and_follow(@email_no_patient)
    assert_redirected_to new_patient_path
  end

  test "login takes to therapist selection if missing" do
    log_in_and_follow(@email_no_therapist)
    assert_redirected_to search_index_path
  end

  # TODO: add a test for user logging in with @email once that handling is in

end
