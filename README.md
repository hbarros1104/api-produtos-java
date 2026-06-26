
## Como rodar

```
docker compose up --build
```
## Testando os endpoints

```
# Criar produto
curl -X POST localhost:8080/produtos -H "Content-Type: application/json" -d "{\"nome\":\"Caneca\",\"descricao\":\"Caneca de porcelana\",\"preco\":29.90,\"quantidade\":10}"

# Listar todos
curl localhost:8080/produtos

# Buscar um (troque o 1 pelo id retornado na criação)
curl localhost:8080/produtos/1

# Atualizar
curl -X PUT localhost:8080/produtos/1 -H "Content-Type: application/json" -d "{\"nome\":\"Caneca Grande\",\"descricao\":\"Caneca de porcelana 500ml\",\"preco\":34.90,\"quantidade\":8}"

# Deletar
curl -X DELETE localhost:8080/produtos/1
```
