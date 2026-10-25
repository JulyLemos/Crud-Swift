import Foundation   

var pessoas: [String: [String]] = [:]

func ler(_ mensagem: String) -> String? {
    print(mensagem)
    guard let entrada = readLine() else {
        return nil
    }
    return entrada.trimmingCharacters(in: .whitespaces)
}

func lerDadosPessoa() -> [String]? {
    guard let email = ler("Digite o email da pessoa:") else { return nil }
    guard let telefone = ler("Digite o telefone da pessoa:") else { return nil }
    guard let idade = ler("Digite a idade da pessoa:") else { return nil }
    return [email, telefone, idade]
}

func exibirMenu() {
    print()
    print("Escolha uma opção:")
    print("1. Incluir dados de uma pessoa")
    print("2. Alterar dados de uma pessoa")
    print("3. Apagar dados de uma pessoa")
    print("4. Exibir dados de uma pessoa")
    print("5. Exibir dados de todas as pessoas")
    print("6. Finalizar o programa")
}

func exibirPessoaFormatada(nome: String, dados: [String]) {
    print("Nome: \(nome)")
    print("Email: \(dados[0])")
    print("Telefone: \(dados[1])")
    print("Idade: \(dados[2])")
}

func incluirPessoa() {
    guard let nome = ler("Digite o nome da pessoa:") else { return }

    if nome.isEmpty {
        print("O nome não pode ser vazio.")
        return
    }

    if pessoas[nome] != nil {
        print("Já existe uma pessoa com esse nome!")
        return
    }

    guard let dados = lerDadosPessoa() else { return }

    pessoas[nome] = dados
    print("Pessoa adicionada com sucesso!")
    print(pessoas)
}

func alterarPessoa() {
    guard let nome = ler("Digite o nome da pessoa que deseja alterar:") else { return }

    if pessoas[nome] == nil {
        print("Pessoa não encontrada!")
        return
    }

    print("Digite os novos dados de \(nome):")
    guard let dados = lerDadosPessoa() else { return }

    pessoas[nome] = dados
    print("Dados alterados com sucesso!")
    print(pessoas)
}

func apagarPessoa() {
    guard let nome = ler("Digite o nome da pessoa que deseja apagar:") else { return }

    if pessoas.removeValue(forKey: nome) != nil {
        print("Pessoa apagada com sucesso!")
        print(pessoas)
    } else {
        print("Pessoa não encontrada!")
    }
}

func exibirPessoa() {
    guard let nome = ler("Digite o nome da pessoa que deseja exibir:") else { return }

    if let dados = pessoas[nome] {
        exibirPessoaFormatada(nome: nome, dados: dados)
    } else {
        print("Pessoa não encontrada!")
    }
}

func exibirTodasPessoas() {
    if pessoas.isEmpty {
        print("Nenhuma pessoa cadastrada.")
        return
    }

    for nome in pessoas.keys.sorted() {
        if let dados = pessoas[nome] {
            exibirPessoaFormatada(nome: nome, dados: dados)
            print("-----")
        }
    }
}


var continuar = true

while continuar {
    exibirMenu()

    guard let opcao = readLine() else {
        break  
    }

    switch opcao.trimmingCharacters(in: .whitespaces) {
    case "1":
        incluirPessoa()
    case "2":
        alterarPessoa()
    case "3":
        apagarPessoa()
    case "4":
        exibirPessoa()
    case "5":
        exibirTodasPessoas()
    case "6":
        print("Programa finalizado.")
        continuar = false
    default:
        print("Opção inválida!")
    }
}
