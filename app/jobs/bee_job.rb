# frozen_string_literal: true

class BeeJob < ApplicationJob
  sidekiq_options retry: 5

  def perform(foo, bar)
    # Do something later
    p foo + bar
    p '********************************'
  end
end
