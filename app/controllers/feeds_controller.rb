class FeedsController < ApplicationController
  def atom
    @versions = Version.latest.limit(10).includes(:project)
  end
end
