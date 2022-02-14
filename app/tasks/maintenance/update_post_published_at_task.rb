# frozen_string_literal: true

module Maintenance
  class UpdatePostPublishedAtTask < MaintenanceTasks::Task
    def collection
      # Collection to be iterated over
      # Must be Active Record Relation or Array
      Post.in_batches
    end

    def process(post_batch)
      # The work to be done in a single iteration of the task.
      # This should be idempotent, as the same element may be processed more
      # than once if the task is interrupted and resumed.
      post_batch.update_all(published_at: Time.current)
      sleep 0.1
    end

    def count
      # Optionally, define the number of rows that will be iterated over
      # This is used to track the task's progress
      collection.count
    end
  end
end
