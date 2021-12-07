class Api::V1::FriendshipsController < Api::V1::GraphitiController
  def index
    friendships = FriendshipResource.all(params)
    respond_with(friendships)
  end

  def show
    friendship = FriendshipResource.find(params)
    respond_with(friendship)
  end

  def create
    friendship = FriendshipResource.build(params)

    if friendship.save
      render jsonapi: friendship, status: :created
    else
      render jsonapi_errors: friendship
    end
  end

  def update
    friendship = FriendshipResource.find(params)

    if friendship.update_attributes
      render jsonapi: friendship
    else
      render jsonapi_errors: friendship
    end
  end

  def destroy
    friendship = FriendshipResource.find(params)

    if friendship.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: friendship
    end
  end
end
