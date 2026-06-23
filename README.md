# demo — API de produtos com MySQL e Docker

Esse é o seu projeto Spring Boot (pacote `So2.demo`) com o CRUD de produtos e o banco MySQL já integrados.

## O que tem aqui

- `pom.xml` — dependências de JPA e do driver do MySQL adicionadas.
- `Dockerfile` — ajustado para o Spring Boot 4.1 (flag de skip de testes corrigida).
- `docker-compose.yml` — sobe dois containers: a API (`app`) e o banco (`db`, MySQL).
- `src/main/java/So2/demo/DemoApplication.java` — sua classe principal, sem alterações.
- `src/main/java/So2/demo/model/Produto.java` — entidade que mapeia a tabela `produto`.
- `src/main/java/So2/demo/repository/ProdutoRepository.java` — acesso ao banco via JPA.
- `src/main/java/So2/demo/service/ProdutoService.java` — regras de criar, atualizar e deletar.
- `src/main/java/So2/demo/controller/ProdutoController.java` — endpoints HTTP do CRUD.
- `src/main/resources/application.properties` — config de conexão com o MySQL.
- `src/test/java/So2/demo/DemoApplicationTests.java` — seu teste padrão, sem alterações.

**Atenção:** eu não tinha o conteúdo original do seu `application.properties`, então recriei ele só com `spring.application.name=demo` (padrão do Spring Initializr) mais a configuração do banco. Se o seu arquivo original tinha outras linhas, copie-as para esse arquivo antes de substituir.

Esta pasta não inclui `mvnw`, `mvnw.cmd` e `.mvn/` porque eles não mudam — continue usando os que você já tem no seu projeto.

## Como rodar

Extraia esta pasta dentro do seu projeto (ou substitua os arquivos equivalentes) e rode, na raiz:

```
docker compose up --build
```

Na primeira vez vai demorar um pouco mais, pois ele baixa a imagem do MySQL. Depois disso a API fica em `localhost:8080/produtos`.

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
