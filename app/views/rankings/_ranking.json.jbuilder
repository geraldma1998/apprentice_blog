# frozen_string_literal: true

json.extract! ranking, :id, :rank, :created_at, :updated_at
json.url ranking_url(ranking, format: :json)
