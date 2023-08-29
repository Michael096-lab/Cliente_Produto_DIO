'''
Calculadora Simples.
Nela foi usado funções para realizar as operações desejadas pelo usuário.
São realizadas as 4 operações básicas, até que o usuário queira sair do sistema.
'''

# Funçaõ para somar.
def adicao(x, y):
    return x + y


# Função para subtrair.
def subtracao(x, y):
    return x - y


# Função para multiplicar.
def multiplicacao(x, y):
    return x * y


# Função para dividir.
def divisao(x, y):
    return x / y

print("#" * 20)
print("---> Menu! <---".upper())
print("1.Adição".upper())
print("2.Subtração".upper())
print("3.Multiplicação".upper())
print("4.Divisão".upper())
print("#" * 20)

while True:
    # verifica a opçaõ desejada
    opcao = input("\nSelecione a operação desejada <-> (1/2/3/4/5): ")

    # Se a opção escolhida for igual a 5, saimos do sistema.
    if opcao == '5':
        print(" Saindo do sistema!!\n Obridado pela preferencia!!")
        break

    # verifica a opção e realiza a operação.
    if opcao in ('1', '2', '3', '4'):
        num1 = float(input("Digite o primeiro número:  "))
        num2 = float(input("Digite o segundo número: "))

        if opcao == '1':
            print("\nADIÇÃO")
            print(num1, "+", num2, "=", adicao(num1, num2))

        elif opcao == '2':
            print("\nSUBTRAÇÃO")
            print(num1, "-", num2, "=", subtracao(num1, num2))

        elif opcao == '3':
            print("\nMULTIPLICAÇÃO")
            print(num1, "*", num2, "=", multiplicacao(num1, num2))

        elif opcao == '4':
            print("\nDIVISÃO")
            print(num1, "/", num2, "=", divisao(num1, num2))

    else:
        print("""
        Opção Inválida! 
        Você deve digitar uma opção entre (1 e 4) ou digitar 5 para sair do sistema !
        """)

