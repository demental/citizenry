class Api::PeopleController < ApplicationController
  respond_to :json

  def random
    @person = Person.find_random
  end
end