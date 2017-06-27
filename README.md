# Viva Real Challenge

## Ferramentas

* Ruby 2.4.1
* Rails 5.1.1
* RSpec 3.7
* PostgreSql 9.5

## Instalação
1. Clonar o repositório

```console
git clone git@github.com:eoliveiramg/viva_challenge.git
```

2. Acessar o diretório clonado

```console
cd viva_challenge/
```

3. Instalar a gem Bundler

```console
gem install bundler
```

4. Executar o comando abaixo para que seja realizado o build das dependências de gemas

```console
bundle install
```

5. Copie e adicione suas configurações locais para o banco de dados
```console
cp config/database.yml.sample config/database.yml
```

6. Realize a instalação do banco de dados
```console
bundle exec rails db:setup
```

7. Execute o servidor e acesse através da url http://localhost:3000
```console
bundle exec rails server
```

### Observação
Antes de iniciar a castro de novas propriedades é necessário realizar a importação do mapa de Provinceas, onde as propriedades podem ser registradas
```console
Execute a API:
POST /api/v1/provinces
```
Como parâmetro você deve enviar um json com as informações sobre as Provinceas a serem criadas.
Esse arquivo você encontra em:
```console
/public/city_map.json
```
ou no link [Mapa de Spotippos](https://raw.githubusercontent.com/VivaReal/code-challenge/master/provinces.json)

### APIs
#### 1. Crie imóveis em Spotippos :)
Request
```console
POST /properties
```
Body
```console
{
  "x": 222,
  "y": 444,
  "title": "Imóvel código 1, com 5 quartos e 4 banheiros",
  "price": 1250000,
  "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  "beds": 4,
  "baths": 3,
  "squareMeters": 210
}
```

#### 2. Mostre um imóvel específico em Spotippos =]
Request
```console
GET /properties/{id}
```
Response example
```console
{
  "id": 665,
  "title": "Imóvel código 665, com 1 quarto e 1 banheiro",
  "price": 540000,
  "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  "x": 667,
  "y": 556,
  "beds": 1,
  "baths": 1,
  "provinces" : ["Ruja"],
  "squareMeters": 42
}
```
#### 3. Busque imóveis em Spotippos :D
Request simples sem filtro
```console
GET /properties
```
Request com filtro
```console
GET /properties?ax={integer}&ay={integer}&bx={integer}&by={integer}
```
Params
```console
ax => Representa a coordenada Superior esquerdo no mapa referênte ao exio X
ay => Representa a coordenada Superior esquerdo no mapa referênte ao exio Y
bx => Representa a coordenada Inferior direito no mapa referênte ao exio X
by => Representa a coordenada Inferior direito no mapa referênte ao exio y
```
Response example
```console
{
  "foundProperties": 3,
  "properties": [
    {
      "id": 34,
      "title": "Imóvel código 34, com 4 quartos e 3 banheiros",
      "price": 1250000,
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "x": 999,
      "y": 333,
      "beds": 4,
      "baths": 3,
      "squareMeters": 237,
      "provinces" : ["Scavy", "Gode"]
    },
    {"..."},
    {"..."}
  ]
}
```