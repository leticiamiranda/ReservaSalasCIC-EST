json.extract! recurso, :id, :nome, :qtd, :created_at, :updated_at
json.url recurso_url(recurso, format: :json)