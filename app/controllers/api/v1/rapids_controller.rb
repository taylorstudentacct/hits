class Api::V1::RapidsController < Api::V1::GraphitiController
  def index
    rapids = RapidResource.all(params)
    respond_with(rapids)
  end

  def show
    rapid = RapidResource.find(params)
    respond_with(rapid)
  end

  def create
    rapid = RapidResource.build(params)

    if rapid.save
      render jsonapi: rapid, status: 201
    else
      render jsonapi_errors: rapid
    end
  end

  def update
    rapid = RapidResource.find(params)

    if rapid.update_attributes
      render jsonapi: rapid
    else
      render jsonapi_errors: rapid
    end
  end

  def destroy
    rapid = RapidResource.find(params)

    if rapid.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: rapid
    end
  end
end
