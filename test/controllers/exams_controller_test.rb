require 'test_helper'

class ExamsControllerTest < ActionController::TestCase
  setup do
    @exam = exams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exam" do
    assert_difference('Exam.count') do
      post :create, exam: { level: @exam.level, points: @exam.points, question10: @exam.question10, question1: @exam.question1, question2: @exam.question2, question3: @exam.question3, question4: @exam.question4, question5: @exam.question5, question6: @exam.question6, question7: @exam.question7, question8: @exam.question8, question9: @exam.question9, text: @exam.text, title: @exam.title }
    end

    assert_redirected_to exam_path(assigns(:exam))
  end

  test "should show exam" do
    get :show, id: @exam
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exam
    assert_response :success
  end

  test "should update exam" do
    patch :update, id: @exam, exam: { level: @exam.level, points: @exam.points, question10: @exam.question10, question1: @exam.question1, question2: @exam.question2, question3: @exam.question3, question4: @exam.question4, question5: @exam.question5, question6: @exam.question6, question7: @exam.question7, question8: @exam.question8, question9: @exam.question9, text: @exam.text, title: @exam.title }
    assert_redirected_to exam_path(assigns(:exam))
  end

  test "should destroy exam" do
    assert_difference('Exam.count', -1) do
      delete :destroy, id: @exam
    end

    assert_redirected_to exams_path
  end
end
