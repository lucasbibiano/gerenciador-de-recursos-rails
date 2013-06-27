# -*- encoding : utf-8 -*-
require 'test_helper'

class ObjectResourcesControllerTest < ActionController::TestCase
  setup do
    @object_resource = object_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:object_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create object_resource" do
    assert_difference('ObjectResource.count') do
      post :create, object_resource: { description: @object_resource.description, name: @object_resource.name, tombamento: @object_resource.tombamento }
    end

    assert_redirected_to object_resource_path(assigns(:object_resource))
  end

  test "should show object_resource" do
    get :show, id: @object_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @object_resource
    assert_response :success
  end

  test "should update object_resource" do
    put :update, id: @object_resource, object_resource: { description: @object_resource.description, name: @object_resource.name, tombamento: @object_resource.tombamento }
    assert_redirected_to object_resource_path(assigns(:object_resource))
  end

  test "should destroy object_resource" do
    assert_difference('ObjectResource.count', -1) do
      delete :destroy, id: @object_resource
    end

    assert_redirected_to object_resources_path
  end
end
