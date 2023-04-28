require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/room.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Room.count, data.length
  end

  test "create" do
    assert_difference "Room.count", 1 do
      post "/rooms.json", params: { user_id: 6, address: "3800 Maycraft ct", city: "Dallas", state: "TX", description: "In the community", home_type: "House", room_type: "full-bedroom", total_occupancy: 5, total_bedrooms: 4, total_bathrooms: 4 }
      assert_response 200
    end
  end

  test "show" do
    get "/rooms/#{Room.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["user_id", "address", "city", "state", "description", "home_type", "room_type", "total_occupancy", "total_bedrooms","total_bathrooms" ], data.keys
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
