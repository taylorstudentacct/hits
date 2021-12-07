class Api::V1::RiversController < Api::V1::GraphitiController
  def index
    rivers = RiverResource.all(params)
    respond_with(rivers)
  end

  def show
    river = RiverResource.find(params)
    respond_with(river)
  end

  def create
    river = RiverResource.build(params)

    if river.save
      render jsonapi: river, status: :created
    else
      render jsonapi_errors: river
    end
  end

  def update
    river = RiverResource.find(params)

    if river.update_attributes
      render jsonapi: river
    else
      render jsonapi_errors: river
    end
  end

  def destroy
    river = RiverResource.find(params)

    if river.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: river
    end
  end
end
