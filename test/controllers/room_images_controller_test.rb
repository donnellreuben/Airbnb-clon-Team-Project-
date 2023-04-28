require "test_helper"

class RoomImagesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/room_image.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Room_image.count, data.length
  end

  test "create" do
    assert_difference "Room_image.count", 1 do
      post "/room_images.json", params: {room_id: 7, url: "airbnb.com" }
      assert_response 200
    end
  end

  test "show" do
    get "/room_images/#{Room_image.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["room_id", "url" ], data.keys
  end

  test "update" do
    room = Room.first
    patch "/rooms/#{room.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Room.count", -1 do
      delete "/rooms/#{Room.first.id}.json"
      assert_response 200
    end
  end
  
end
