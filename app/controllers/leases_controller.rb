class LeasesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        leases = Lease.all
        render json: leases
    end

    def show
        lease = find_lease
        render json: lease
    end

    def create
        lease = Lease.create(lease_params)
        render json: lease, status: :created
    end

    def destroy
        lease = find_lease
        lease.destroy
        head :no_content
    end

private

    def lease_params
        params.permit(:rent)
    end

    def find_lease
        Lease.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Lease not found"}, status: :not_found
    end
end
