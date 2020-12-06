module Professors
  class DashboardController < ApplicationController
    def index
      render inertia: 'Professors/Dashboard/Index.vue'
    end
  end
end
