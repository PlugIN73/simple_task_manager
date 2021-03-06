require 'test_helper'
include ApplicationHelper

class StoriesControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    @author = create :author
    @story = create :story, user: @user, author: @author
    sign_in @user
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create story" do
    assert_difference('Story.count') do
      post :create, story: { author_id: @story.author_id, description: @story.description, state: @story.state, title: @story.title, user_id: @story.user_id }
    end
    assert_redirected_to story_path(assigns(:story))
  end

  test "should show story" do
    get :show, id: @story
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @story
    assert_response :success
  end

  test "should update story" do
    put :update, id: @story, story: { author_id: @story.author_id, description: @story.description, state: @story.state, title: @story.title, user_id: @story.user_id }
    assert_redirected_to story_path(assigns(:story))
  end

  test "should destroy story" do
    assert_difference('Story.count', -1) do
      delete :destroy, id: @story
    end
    assert_equal(signed_in?, @user)
    assert_redirected_to stories_path
  end

  test "should put change_state" do
    put :change_state, story_id: @story.id, event: "accept"
    assert_redirected_to stories_path
  end
end
