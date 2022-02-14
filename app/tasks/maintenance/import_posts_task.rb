# frozen_string_literal: true

module Maintenance
  class ImportPostsTask < MaintenanceTasks::Task
    csv_collection
    attribute :updated_content, :string
    validates :updated_content, presence: true

    def process(row)
      body = "#{updated_content} #{row['body']}"
      Post.create(title: row["title"], body: body)
    end
  end
end
