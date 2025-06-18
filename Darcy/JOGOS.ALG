algoritmo "CASSINO"

var
   // Variáveis Numéricas (real)
   saldo, aposta, multiplicador, deposito: real

   // Vetores
   sorteio: vetor[1..3] de inteiro
   historico: vetor[1..100] de caractere

   // Contadores e controles de opção
   i, j, opj, opcao, rodada: inteiro
   opcao21, opcaoDado: inteiro

   // Controle de jogo de cartas 21
   carta, carta1, totalJogador, totalComputador: inteiro

   // Controle de jogo de dados
   dado1, dado2, soma: inteiro

   // Variáveis de texto/caractere (respostas, decisões e menus)
   continuar, continuar21, continuarcarta, continuarCassino, ContinuarDado: caractere
   ctz, decisaoFinal: caractere
   resultado: caractere

   // Variáveis lógicas (controle de fluxo)
   jogando21, jogandoCassino, jogandoDado, rodandoMenu: logico
   
   
inicio
   // Inicializa o saldo do jogador com 100 reais
   saldo := 100.0

   // Contador de rodadas, inicia em 0
   rodada := 0

   // Controle do loop principal do menu de jogos
   rodandoMenu := verdadeiro

   // Loop principal que mantém o menu ativo enquanto rodandoMenu for verdadeiro
   enquanto rodandoMenu faca
      limpatela
      escreval("Saldo atual: R$ ", saldo:0:2)
      escreval("+------------------------------+")
      escreval("|          MENU DE JOGOS       |")
      escreval("|------------------------------|")
      escreval("| 1 - JOGO DE CARTAS 21        |")
      escreval("| 2 - CAÇA-NÍQUEIS             |")
      escreval("| 3 - JOGO DE DADOS            |")
      escreval("| 4 - DEPOSITAR                |")
      escreval("| 5 - SAIR                     |")
      escreval("+------------------------------+")

      // Recebe a opção escolhida pelo usuário
      leia(opj)

      escolha opj
      caso 1
         // Entrar no jogo de cartas 21
         jogando21 := verdadeiro

         // Loop dentro do jogo 21, até o usuário decidir sair
         enquanto jogando21 faca
            limpatela
            escreval("+------------------------------+")
            escreval("|        JOGO DE CARTAS 21     |")
            escreval("|------------------------------|")
            escreval("| 1 - Jogar                    |")
            escreval("| 2 - Ver saldo                |")
            escreval("| 3 - Regras                   |")
            escreval("| 4 - Voltar ao menu           |")
            escreval("+------------------------------+")

            // Opção dentro do jogo 21
            leia(opcao21)

            escolha opcao21
            caso 1
               limpatela
               escreval("Saldo atual: R$ ", saldo:0:2)
               escreval("Digite o valor da aposta:")
               leia(aposta)

               // Validação da aposta
               se (aposta > saldo) ou (aposta <= 0) entao
                  escreval("Aposta inválida. Tente novamente.")
               senao
                  totalJogador := 0
                  totalComputador := 0
                  continuarcarta := "S"

                  // Turno do jogador: ele pode pedir cartas enquanto quiser
                  repita
                     limpatela
                     carta := randi(10) + 1   // Sorteia uma carta entre 1 e 10
                     totalJogador := totalJogador + carta

                     escreval("Você tirou: ", carta)
                     escreval("Total atual: ", totalJogador)

                     // Se jogador fizer 21, vence automaticamente
                     se totalJogador = 21 entao
                        escreval("Você fez 21! Vitória garantida!")
                        saldo := saldo + aposta
                        continuarcarta := "N"
                     senao
                        // Se passar de 21, perde a rodada
                        se totalJogador > 21 entao
                           escreval("Você estourou! Perdeu a rodada.")
                           saldo := saldo - aposta
                           continuarcarta := "N"
                        senao
                           // Pergunta se deseja continuar puxando cartas
                           escreval("Deseja outra carta? (S/N)")
                           leia(continuarcarta)
                        fimse
                     fimse
                  ate (continuarcarta <> "S")

                  // Se jogador não estourou, computador joga
                  se totalJogador <= 21 entao
                     escreval("===============================")
                     escreval("Vez do computador...")

                     // Computador puxa cartas até ter 17 ou mais pontos
                     enquanto totalComputador < 17 faca
                        carta1 := randi(10) + 1
                        totalComputador := totalComputador + carta1
                        escreval("Computador tirou: ", carta1)
                        escreval("Total do Computador: ", totalComputador)
                     fimenquanto

                     escreval("===============================")
                     escreval("Total final do jogador: ", totalJogador)
                     escreval("Total final do computador: ", totalComputador)

                     // Verifica resultado final da rodada
                     se totalComputador > 21 entao
                        escreval("Computador estourou! Você venceu!")
                        saldo := saldo + aposta
                     senao
                        se totalJogador > totalComputador entao
                           escreval("Você venceu!")
                           saldo := saldo + aposta
                        senao
                           se totalJogador = totalComputador entao
                              escreval("Empate!")
                           senao
                              escreval("Você perdeu.")
                              saldo := saldo - aposta
                           fimse
                        fimse
                     fimse
                  fimse
               fimse

            caso 2
               // Mostrar saldo atual
               limpatela
               escreval("Seu saldo atual é: R$ ", saldo:0:2)
            caso 3
               // Mostrar regras do jogo
               limpatela
               escreval("Regras do Jogo 21:")
               escreval("- O objetivo é se aproximar de 21 sem ultrapassar.")
               escreval("- Você começa com 0 pontos e vai tirando cartas entre 1 e 10.")
               escreval("- Se ultrapassar 21, você perde automaticamente.")
               escreval("- Se tiver mais pontos que o computador, você vence.")
               escreval("- Empates não alteram o saldo.")
            caso 4
               // Voltar para o menu principal, sair do jogo 21
               jogando21 := falso
            outrocaso
               escreval("Opção inválida.")
            fimescolha

            // Pergunta se deseja continuar no jogo 21
            se jogando21 entao
               escreval("Deseja continuar no Jogo 21? (S/N)")
               leia(continuar21)
               se continuar21 <> "S" entao
                  jogando21 := falso
               fimse
            fimse
         fimenquanto

         // Inicia o modo de jogar cassino
      caso 2
         jogandoCassino := verdadeiro

         enquanto jogandoCassino faca
            limpatela
            escreval("+------------------------------+")
            escreval("|         CAÇA-NÍQUEIS         |")
            escreval("|------------------------------|")
            escreval("| 1 - Jogar                    |")
            escreval("| 2 - Ver saldo                |")
            escreval("| 3 - Ver histórico            |")
            escreval("| 4 - Regras                   |")
            escreval("| 5 - Voltar ao menu           |")
            escreval("+------------------------------+")
            leia(opcao)  // Lê a opção do usuário no menu cassino

            escolha opcao
            caso 1
               limpatela
               escreval("Digite o valor da aposta:")
               leia(aposta)

               // Valida aposta: deve ser maior que zero e menor ou igual ao saldo
               se (aposta > saldo) ou (aposta <= 0) entao
                  escreval("Aposta inválida.")
               senao
                  escreval("Girando os rolos...")

                  // Sorteia 3 números aleatórios de 1 a 9 para os rolos
                  para i de 1 ate 3 faca
                     sorteio[i] := randi(9) + 1
                     escreval("Rolo ", i, ": ", sorteio[i])
                  fimpara

                  // Exibe resultado final dos rolos
                  escreval("+----------------------------------------+")
                  escreval("|              RESULTADO FINAL           |")
                  escreval("|----------------------------------------|")
                  escreval("|         +------------------+           |")
                  escreval("|             |", sorteio[1], " |", sorteio[2], " |", sorteio[3], " |              |")
                  escreval("|         +------------------+           |")
                  escreval("+----------------------------------------+")

                  // Verifica combinações e define multiplicador e mensagem de resultado
                  se (sorteio[1] = 1) e (sorteio[2] = 1) e (sorteio[3] = 1) entao
                     multiplicador := 3.0
                     resultado := "Jackpot 1-1-1! Parabéns!"
                  senao
                     se (sorteio[1] = 2) e (sorteio[2] = 2) e (sorteio[3] = 2) entao
                        multiplicador := 2.5
                        resultado := "Triplo 2! Sorte boa!"
                     senao
                        se (sorteio[1] = 3) e (sorteio[2] = 3) e (sorteio[3] = 3) entao
                           multiplicador := 4.0
                           resultado := "Triplo 3! Mega prêmio!"
                        senao
                           se (sorteio[1] = 4) e (sorteio[2] = 4) e (sorteio[3] = 4) entao
                              multiplicador := 3.5
                              resultado := "Trinca de 4! Bom prêmio!"
                           senao
                              se (sorteio[1] = 5) e (sorteio[2] = 5) e (sorteio[3] = 5) entao
                                 multiplicador := 5.0
                                 resultado := "Triplo 5! Jackpot supremo!"
                              senao
                                 se (sorteio[1] = 6) e (sorteio[2] = 6) e (sorteio[3] = 6) entao
                                    multiplicador := 1.0
                                    resultado := "Trinca de 6! Prêmio tranquilo!"
                                 senao
                                    se (sorteio[1] = 7) e (sorteio[2] = 7) e (sorteio[3] = 7) entao
                                       multiplicador := 1.5
                                       resultado := "Trinca de 7! Prêmio legal!"
                                    senao
                                       se (sorteio[1] = 8) e (sorteio[2] = 8) e (sorteio[3] = 8) entao
                                          multiplicador := 2.0
                                          resultado := "Trinca de 8! Prêmio bacana!"
                                       senao
                                          se (sorteio[1] = 9) e (sorteio[2] = 9) e (sorteio[3] = 9) entao
                                             multiplicador := 1.7
                                             resultado := "Trinca de 9! Prêmio legal!"
                                          senao
                                             // Checa se todos os três números são iguais (trinca especial)
                                             se (sorteio[1] = sorteio[2]) e (sorteio[2] = sorteio[3]) entao
                                                multiplicador := 3.2
                                                resultado := "Trinca especial! Grande prêmio!"
                                             senao
                                                // Checa se há pelo menos dois números iguais
                                                se (sorteio[1] = sorteio[2]) ou (sorteio[2] = sorteio[3]) ou (sorteio[1] = sorteio[3]) entao
                                                   multiplicador := 1.3
                                                   resultado := "Dois números iguais! Prêmio pequeno."
                                                senao
                                                   // Sequências específicas 1-2-3 ou 3-2-1 (empate técnico)
                                                   se ((sorteio[1] = 1) e (sorteio[2] = 2) e (sorteio[3] = 3)) ou ((sorteio[1] = 3) e (sorteio[2] = 2) e (sorteio[3] = 1)) entao
                                                      multiplicador := 1.1
                                                      resultado := "Sequência 1-2-3 ou 3-2-1! Empate técnico."
                                                   senao
                                                      // Sequências específicas 4-5-6 ou 6-5-4 (prêmio bacana)
                                                      se ((sorteio[1] = 4) e (sorteio[2] = 5) e (sorteio[3] = 6)) ou ((sorteio[1] = 6) e (sorteio[2] = 5) e (sorteio[3] = 4)) entao
                                                         multiplicador := 1.2
                                                         resultado := "Sequência 4-5-6 ou 6-5-4! Prêmio bacana."
                                                      senao
                                                         // Nenhuma combinação especial
                                                         multiplicador := -0.1
                                                         resultado := "Nenhuma combinação. Perdeu pouco."
                                                      fimse
                                                   fimse
                                                fimse
                                             fimse
                                          fimse
                                       fimse
                                    fimse
                                 fimse
                              fimse
                           fimse
                        fimse
                     fimse
                  fimse

                  // Atualiza saldo considerando aposta e multiplicador
                  saldo := saldo + (aposta * multiplicador) - aposta
                  escreval("Resultado:", resultado)
                  escreval("Multiplicador: ", multiplicador:0:2)
                  escreval("Novo saldo: R$ ", saldo:0:2)

                  // Atualiza o histórico e o número da rodada
                  rodada := rodada + 1
                  historico[rodada] := resultado

                  // Verifica se o jogador perdeu todo o saldo
                  se (saldo <= 0) entao
                     escreval("Você perdeu todo o seu dinheiro!")
                  fimse
               fimse

            caso 2
               limpatela
               escreval("Seu saldo atual é: R$ ", saldo:0:2)

            caso 3
               limpatela
               escreval("Histórico de partidas:")
               se (rodada = 0) entao
                  escreval("Nenhuma rodada jogada ainda.")
               senao
                  // Exibe o histórico completo das rodadas jogadas
                  para j de 1 ate rodada faca
                     escreval("Rodada ", j, ": ", historico[j])
                  fimpara
               fimse

            caso 4
               limpatela
               // Explica as regras do jogo cassino para o usuário
               escreval("Regras do Cassino:")
               escreval("- Aposte um valor dentro do seu saldo.")
               escreval("- Três números são sorteados entre 1 e 9.")
               escreval("- Combinações especiais geram multiplicadores:")
               escreval("  1-1-1 -> x3.0")
               escreval("  2-2-2 -> x2.5")
               escreval("  3-3-3 -> x5.0")
               escreval("  3-1-3 -> x-0.3 (perda)")
               escreval("  Dois iguais -> x1.2")
               escreval("  Nenhum igual -> perde a aposta")

            caso 5
               // Sai do cassino
               jogandoCassino := falso

            outrocaso
               escreval("Opção inválida.")
            fimescolha

            // Pergunta se o jogador deseja continuar no cassino
            se jogandoCassino entao
               escreval("Deseja continuar no CAÇA-NÍQUEIS? (S/N)")
               leia(continuarCassino)
               se continuarCassino <> "S" entao
                  jogandoCassino := falso
               fimse
            fimse
         fimenquanto

      caso 3
         // Ativa a flag para o loop do jogo de dados
         jogandoDado := verdadeiro

         enquanto jogandoDado faca
            limpatela
            // Exibe o menu do jogo de dados
            escreval("+------------------------------+")
            escreval("|         JOGO DE DADOS        |")
            escreval("|------------------------------|")
            escreval("| 1 - Jogar                    |")
            escreval("| 2 - Ver saldo                |")
            escreval("| 3 - Regras                   |")
            escreval("| 4 - Voltar ao menu           |")
            escreval("+------------------------------+")
            leia(opcaoDado)

            escolha opcaoDado
            caso 1
               limpatela
               // Mostra saldo atual ao jogador
               escreval("Saldo atual: R$ ", saldo:0:2)
               // Pede para o jogador digitar o valor da aposta
               escreval("Digite o valor da aposta:")
               leia(aposta)

               // Verifica se a aposta é válida (não maior que saldo e maior que zero)
               se (aposta > saldo) ou (aposta <= 0) entao
                  escreval("Aposta inválida.")
               senao
                  // Sorteia os valores dos dois dados (de 1 a 6)
                  dado1 := randi(6) + 1
                  dado2 := randi(6) + 1
                  soma := dado1 + dado2

                  // Exibe os valores dos dados e a soma
                  escreval("Dado 1: ", dado1)
                  escreval("Dado 2: ", dado2)
                  escreval("Soma dos dados: ", soma)

                  // Verifica se os dados formam uma dupla
                  se (dado1 = dado2) entao
                     escreval("Dupla! Você ganhou 3x a aposta!")
                     // Dá prêmio triplo
                     saldo := saldo + (aposta * 3)
                  senao
                     // Se não for dupla, verifica se a soma é par
                     se (soma mod 2 = 0) entao
                        escreval("Soma par! Você ganhou o dobro!")
                        // Dá prêmio dobro
                        saldo := saldo + (aposta * 2)
                     senao
                        // Se soma for ímpar, perde a aposta
                        escreval("Soma ímpar! Você perdeu a aposta.")
                        saldo := saldo - aposta
                     fimse
                  fimse
               fimse

            caso 2
               limpatela
               // Mostra o saldo atual
               escreval("Saldo atual: R$ ", saldo:0:2)

            caso 3
               limpatela
               // Exibe as regras do jogo de dados para o jogador
               escreval("REGRAS DO JOGO DE DADOS:")
               escreval("- Você aposta um valor.")
               escreval("- Dois dados são lançados (de 1 a 6).")
               escreval("- Se sair uma dupla (mesmo número nos dois), ganha 3x.")
               escreval("- Se a soma for par, ganha 2x.")
               escreval("- Se a soma for ímpar, perde tudo.")

            caso 4
               limpatela
               // Sai do jogo e retorna ao menu principal
               escreval("Voltando ao menu principal...")
               jogandoDado := falso

            outrocaso
               limpatela
               // Caso o usuário digite uma opção inválida
               escreval("Opção inválida.")
            fimescolha

            // Pergunta se o jogador quer continuar no jogo
            se jogandoDado entao
               escreval("Deseja continuar no Jogo do Dado? (S/N)")
               leia(continuarDado)
               se continuarDado <> "S" entao
                  jogandoDado := falso
               fimse
            fimse
         fimenquanto

      caso 4
         limpatela
         // Exibe a tela para o usuário informar o valor a depositar
         escreval("+==============================+")
         escreval("|       DEPÓSITO DE SALDO      |")
         escreval("+------------------------------+")
         escreval("| Informe o valor a depositar: |")
         escreval("+------------------------------+")
         escreva("R$ ")
         leia(deposito)

         // Verifica se o valor do depósito é válido (maior que zero)
         se deposito <= 0 entao
            escreval()
            escreval("+------------------------------+")
            escreval("|  Valor inválido. Tente novo. |")
            escreval("+------------------------------+")
            escreval("Aperte F9 para prosseguir:")
            pausa
         senao
            // Atualiza o saldo com o valor depositado
            saldo := saldo + deposito
            escreval()
            limpatela
            // Confirmação do depósito e exibe o novo saldo
            escreval("+------------------------------+")
            escreval("| Depósito realizado com sucesso.")
            escreval("| Saldo atual: R$ ", saldo:0:2)
            escreval("+------------------------------+")
            escreval("Aperte F9 para prosseguir:")
            pausa
         fimse

      caso 5
         limpatela
         // Pergunta ao jogador se ele realmente quer sair do cassino
         escreval("VOCÊ DESEJA MESMO SAIR DO CASSINO?")
         escreval("A sorte ainda gira, e os grandes não fogem da mesa.")
         escreval("Digite 'S' para sair ou 'N' para voltar e tentar a sorte mais uma vez.")
         leia(ctz)

         // Se o jogador confirma saída, faz uma última confirmação
         se ctz = "S" entao
            limpatela
            escreval("Hmm... então vai correr agora?")
            escreval("Sabia que 9 em cada 10 desistentes se arrependem depois?")
            escreval("Digite 'SIM' se quiser MESMO ir embora ou qualquer outra coisa para ficar.")
            leia(decisaoFinal)

            // Se o jogador confirma a saída final
            se decisaoFinal = "SIM" entao
               limpatela
               escreval("Tudo bem... Mas não diga que a casa não avisou.")
               escreval("Quem foge do cassino, foge da chance de mudar de vida.")
               escreval("Você está saindo... mas a porta estará sempre aberta.")
               // Finaliza o loop principal para sair do programa
               rodandoMenu := falso
            senao
               // Caso o jogador decida ficar
               limpatela
               escreval("Hahaha... assim que se fala!")
               escreval("A casa gosta dos corajosos. Vamos voltar ao jogo.")
               escreval("Aperte F9 para prosseguir:")
               pausa
            fimse
         senao
            // Caso o jogador escolha não sair do cassino
            limpatela
            escreval("É isso aí, jogador.")
            escreval("Desistir nunca foi uma opção para quem nasceu para vencer.")
            escreval("Aperte F9 para prosseguir:")
            pausa
         fimse

      outrocaso
         limpatela
         // Caso o usuário escolha uma opção inválida no menu
         escreval("Opção inválida.")
         escreval("Aperte F9 para prosseguir:")
         pausa
      fimescolha
   fimenquanto
fimalgoritmo
