## Programa de Formação em Elixir - Stone | Teste Técnico 

Primeira etapa do processo seletivo para o programa de formação em Elixir da Stone.

## O que deve ser feito no desafio?

Imagine uma lista de compras. Ela possui:

- Itens
- Quantidade de cada item
- Preço por unidade/peso/pacote de cada item

Desenvolva uma função (ou método) que irá receber uma lista de compras (como a detalhada acima) e uma lista de e-mails. Aqui, cada e-mail representa uma pessoa.

A aplicação deve:

- Calcular a soma dos valores, ou seja, multiplicar o preço de cada item por sua quantidade e somar todos os itens
- Dividir o valor de forma igual entre a quantidade de e-mails
- Retornar um mapa/dicionário onde a chave será o e-mail e o valor será quanto ele deve pagar nessa conta

## Instalação

Para tal desafio, foi utilizado a linguagem elixir junto com o Mix para facilitar o desenvolvimento e criação de testes.

Para rodar a função main, onde está todo o fluxo principal da aplicação, será necessário executar os seguintes comandos:

	iex -S mix                # Entrar no terminal iex e compilar a aplicação
	StoneChallenge.main       # Executar a função main`

Caso deseje executar os testes, você deverá executar o seguinte comando:

	mix test

##  Solução

Para a geração de itens foi construído uma função que recebe o tamanho da lista desejada e gera itens com quantidade e preço aleatórios. O mesmo foi feito para geração dos email, uma função que recebe o tamanho da lista e gera esses emails utilizando o padrão `user_email_1@example.com`, onde o número vai sendo incrementado a cada novo email gerado.

No cálculo do valor total dos itens foi necessário percorrer a lista e multiplicar o valor de cada item pela sua quantidade.

Para dividir o valor de forma igual entre os emails, é realizada uma checagem que verifica se a divisão é inteira, ou seja, se o valor total dos itens dividido pela quantidade de emails não tem resto.

- Caso não exista resto da divisão, significa que cada email recebe o valor dos itens dividido pela quantidade de emails. 

- Caso exista resto, cada email recebe o quociente da divisão. A partir dai é feita um distribuição de forma circular do resto, até que não haja mais resto para distribuir. Dessa forma, teremos uma lista com emails que têm o valor do quociente, enquanto que a outra parte ficará com o valor do quociente + 1.

Por fim, o Mapa retornado faz tem como chave o email e como valor o que deve ser pago.

## Possíveis Modificações

Caso deseje realizar qualquer modificação para inserir casos de teste desejáveis, o ideal é realizar as modifições no arquivo `lib/stone_challenge.ex`, recompilar e executar usando os comandos descritos acima.
