algoritmo "Jogos"
//Sistema Feito por:
// Maycon Willians
//J�ssica
//Jo�o Lucas

var
   // Vari�veis Num�ricas (real)
   saldo, aposta, multiplicador, deposito: real

   // Vetores
   sorteio: vetor[1..3] de inteiro
   historico: vetor[1..100] de caractere

   // Contadores e controles de op��o
   i, j, opj, opcao, rodada: inteiro
   opcao21, opcaoDado: inteiro

   // Controle de jogo de cartas 21
   carta, carta1, totalJogador, totalComputador: inteiro

   // Controle de jogo de dados
   dado1, dado2, soma: inteiro

   // Vari�veis de texto/caractere (respostas, decis�es e menus)
   continuar, continuar21, continuarcarta, continuarCassino, ContinuarDado: caractere
   ctz, decisaoFinal: caractere
   resultado: caractere

   // Vari�veis l�gicas (controle de fluxo)
   jogando21, jogandoCassino, jogandoDado, rodandoMenu: logico

inicio
   // Inicializa o saldo do jogador com 100 reais
   saldo := 100.0

   // Contador de rodadas, inicia em 0
   rodada := 0

   // Controle do loop principal do menu de jogos
   rodandoMenu := verdadeiro

   // Loop principal que mant�m o menu ativo enquanto rodandoMenu for verdadeiro
   enquanto rodandoMenu faca
      limpatela
      escreval("Saldo atual: R$ ", saldo:0:2)
      escreval("+------------------------------+")
      escreval("�         MENU DE JOGOS        �")
      escreval("�------------------------------�")
      escreval("� 1 - JOGO DE CARTAS 21        �")
      escreval("� 2 - CA�A-N�QUEIS             �")
      escreval("� 3 - JOGO DE DADOS            �")
      escreval("� 4 - DEPOSITAR                �")
      escreval("� 5 - SAIR                     �")
      escreval("+------------------------------+")


      // Recebe a op��o escolhida pelo usu�rio
      leia(opj)

      escolha opj
      caso 1
         // Entrar no jogo de cartas 21
         jogando21 := verdadeiro

         // Loop dentro do jogo 21, at� o usu�rio decidir sair
         enquanto jogando21 faca
            limpatela
            escreval("+--------------------------------------+")
            escreval("|           JOGO DE CARTAS 21          |")
            escreval("+--------------------------------------+")
            escreval("| 1 - Jogar                            |")
            escreval("| 2 - Ver saldo                        |")
            escreval("| 3 - Regras                           |")
            escreval("| 4 - Voltar ao menu                   |")
            escreval("+--------------------------------------+")

            // Op��o dentro do jogo 21
            leia(opcao21)

            escolha opcao21
            caso 1
               limpatela
               escreval("+--------------------------------------+")
               escreval("|              NOVA RODADA             |")
               escreval("+--------------------------------------+")
               escreval("Saldo atual: R$ ", saldo:0:2)
               escreval("Digite o valor da aposta:")
               leia(aposta)

               // Valida��o da aposta
               se (aposta > saldo) ou (aposta <= 0) entao
                  escreval("Aposta inv�lida. Tente novamente.")
               senao
                  totalJogador := 0
                  totalComputador := 0
                  continuarcarta := "S"

                  // Turno do jogador: ele pode pedir cartas enquanto quiser
                  enquanto continuarcarta = "S" faca
                     limpatela
                     carta := randi(10) + 1   // Sorteia uma carta entre 1 e 10
                     totalJogador := totalJogador + carta

                     escreval("+--------------------------------------+")
                     escreval("|         SUA CARTA FOI: ", carta, "            |")
                     escreval("+--------------------------------------+")
                     escreval("| Total atual: ", totalJogador, " pontos               |")
                     escreval("+--------------------------------------+")

                     // Se jogador fizer 21, vence automaticamente
                     se totalJogador = 21 entao
                        escreval("Voc� fez 21! Vit�ria garantida!")
                        saldo := saldo + aposta
                        continuarcarta := "N"
                     senao
                        // Se passar de 21, perde a rodada
                        se totalJogador > 21 entao
                           escreval("Voc� estourou! Perdeu a rodada.")
                           saldo := saldo - aposta
                           continuarcarta := "N"
                        senao
                           // Pergunta se deseja continuar puxando cartas
                           escreval("Deseja outra carta? (S/N)")
                           leia(continuarcarta)
                        fimse
                     fimse
                  fimenquanto

                  // Se jogador n�o estourou, computador joga
                  se totalJogador <= 21 entao
                     limpatela
                     escreval("+-------------------------------------+")
                     escreval("|       VEZ DO COMPUTADOR...          |")
                     escreval("+-------------------------------------+")

                     // Computador puxa cartas at� ter 17 ou mais pontos
                     enquanto totalComputador < 17 faca
                        carta1 := randi(10) + 1
                        totalComputador := totalComputador + carta1
                        escreval("| Computador tirou: ", carta1, "                    ")
                        escreval("| Total do Computador: ", totalComputador, " pontos ")
                     fimenquanto

                     escreval("+--------------------------------------+")
                     escreval("| TOTAL FINAL DO JOGADOR: ", totalJogador, " pontos |")
                     escreval("| TOTAL FINAL DO COMPUTADOR: ", totalComputador, " pontos |")
                     escreval("+--------------------------------------+")

                     // Verifica resultado final da rodada
                     se totalComputador > 21 entao
                        escreval("Computador estourou! Voc� venceu!")
                        saldo := saldo + aposta
                     senao
                        se totalJogador > totalComputador entao
                           escreval("Voc� venceu!")
                           saldo := saldo + aposta
                        senao
                           se totalJogador = totalComputador entao
                              escreval("Empate!")
                           senao
                              escreval("Voc� perdeu.")
                              saldo := saldo - aposta
                           fimse
                        fimse
                     fimse
                  fimse
               fimse

            caso 2
               limpatela
               escreval("+--------------------------------------+")
               escreval("|        SEU SALDO ATUAL �:            |")
               escreval("|          R$ ", saldo:0:2, "                     |")
               escreval("+--------------------------------------+")

            caso 3
               limpatela
               escreval("+--------------------------------------+")
               escreval("|        REGRAS DO JOGO DE 21          |")
               escreval("+--------------------------------------+")
               escreval("- O objetivo � se aproximar de 21 sem ultrapassar.")
               escreval("- Voc� come�a com 0 pontos e vai tirando cartas entre 1 e 10.")
               escreval("- Se ultrapassar 21, perde automaticamente.")
               escreval("- Se tiver mais pontos que o computador, vence.")
               escreval("- Se o computador ultrapassar 21, voc� ganha por elimina��o.")
               escreval("- Empates n�o alteram o saldo.")
               escreval("+--------------------------------------+")

            caso 4
               // Voltar para o menu principal, sair do jogo 21
               jogando21 := falso

            outrocaso
               escreval("Op��o inv�lida. Tente novamente.")

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
            escreval("|         CA�A-N�QUEIS         |")
            escreval("|------------------------------|")
            escreval("| 1 - Jogar                    |")
            escreval("| 2 - Ver saldo                |")
            escreval("| 3 - Ver hist�rico            |")
            escreval("| 4 - Regras                   |")
            escreval("| 5 - Voltar ao menu           |")
            escreval("+------------------------------+")
            leia(opcao)  // L� a op��o do usu�rio no menu cassino

            escolha opcao
            caso 1
               limpatela
               escreval("Digite o valor da aposta:")
               leia(aposta)

               // Valida aposta: deve ser maior que zero e menor ou igual ao saldo
               se (aposta > saldo) ou (aposta <= 0) entao
                  escreval("Aposta inv�lida.")
               senao
                  escreval("Girando os rolos...")

                  // Sorteia 3 n�meros aleat�rios de 1 a 9 para os rolos
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

                  // Verifica combina��es e define multiplicador e mensagem de resultado
                  se (sorteio[1] = 1) e (sorteio[2] = 1) e (sorteio[3] = 1) entao
                     multiplicador := 3.0
                     resultado := "Jackpot 1-1-1! Parab�ns!"
                  senao
                     se (sorteio[1] = 2) e (sorteio[2] = 2) e (sorteio[3] = 2) entao
                        multiplicador := 2.5
                        resultado := "Triplo 2! Sorte boa!"
                     senao
                        se (sorteio[1] = 3) e (sorteio[2] = 3) e (sorteio[3] = 3) entao
                           multiplicador := 4.0
                           resultado := "Triplo 3! Mega pr�mio!"
                        senao
                           se (sorteio[1] = 4) e (sorteio[2] = 4) e (sorteio[3] = 4) entao
                              multiplicador := 3.5
                              resultado := "Trinca de 4! Bom pr�mio!"
                           senao
                              se (sorteio[1] = 5) e (sorteio[2] = 5) e (sorteio[3] = 5) entao
                                 multiplicador := 5.0
                                 resultado := "Triplo 5! Jackpot supremo!"
                              senao
                                 se (sorteio[1] = 6) e (sorteio[2] = 6) e (sorteio[3] = 6) entao
                                    multiplicador := 1.0
                                    resultado := "Trinca de 6! Pr�mio tranquilo!"
                                 senao
                                    se (sorteio[1] = 7) e (sorteio[2] = 7) e (sorteio[3] = 7) entao
                                       multiplicador := 1.5
                                       resultado := "Trinca de 7! Pr�mio legal!"
                                    senao
                                       se (sorteio[1] = 8) e (sorteio[2] = 8) e (sorteio[3] = 8) entao
                                          multiplicador := 2.0
                                          resultado := "Trinca de 8! Pr�mio bacana!"
                                       senao
                                          se (sorteio[1] = 9) e (sorteio[2] = 9) e (sorteio[3] = 9) entao
                                             multiplicador := 1.7
                                             resultado := "Trinca de 9! Pr�mio legal!"
                                          senao
                                             // Checa se todos os tr�s n�meros s�o iguais (trinca especial)
                                             se (sorteio[1] = sorteio[2]) e (sorteio[2] = sorteio[3]) entao
                                                multiplicador := 3.2
                                                resultado := "Trinca especial! Grande pr�mio!"
                                             senao
                                                // Checa se h� pelo menos dois n�meros iguais
                                                se (sorteio[1] = sorteio[2]) ou (sorteio[2] = sorteio[3]) ou (sorteio[1] = sorteio[3]) entao
                                                   multiplicador := 1.3
                                                   resultado := "Dois n�meros iguais! Pr�mio pequeno."
                                                senao
                                                   // Sequ�ncias espec�ficas 1-2-3 ou 3-2-1 (empate t�cnico)
                                                   se ((sorteio[1] = 1) e (sorteio[2] = 2) e (sorteio[3] = 3)) ou ((sorteio[1] = 3) e (sorteio[2] = 2) e (sorteio[3] = 1)) entao
                                                      multiplicador := 1.1
                                                      resultado := "Sequ�ncia 1-2-3 ou 3-2-1! Empate t�cnico."
                                                   senao
                                                      // Sequ�ncias espec�ficas 4-5-6 ou 6-5-4 (pr�mio bacana)
                                                      se ((sorteio[1] = 4) e (sorteio[2] = 5) e (sorteio[3] = 6)) ou ((sorteio[1] = 6) e (sorteio[2] = 5) e (sorteio[3] = 4)) entao
                                                         multiplicador := 1.2
                                                         resultado := "Sequ�ncia 4-5-6 ou 6-5-4! Pr�mio bacana."
                                                      senao
                                                         // Nenhuma combina��o especial
                                                         multiplicador := 0.0
                                                         resultado := "Nenhuma combina��o. Perdeu pouco."
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

                  // Atualiza o hist�rico e o n�mero da rodada
                  rodada := rodada + 1
                  historico[rodada] := resultado

                  // Verifica se o jogador perdeu todo o saldo
                  se (saldo <= 0) entao
                     escreval("Voc� perdeu todo o seu dinheiro!")
                  fimse
               fimse

            caso 2
               limpatela
               escreval("+--------------------------------------+")
               escreval("|        SEU SALDO ATUAL �:            |")
               escreval("|          R$ ", saldo:0:2, "                     |")
               escreval("+--------------------------------------+")

            caso 3
               limpatela
               escreval("+------------------------------+")
               escreval("�      HIST�RICO DE PARTIDAS   �")
               escreval("+------------------------------+")

               se (rodada = 0) entao
                  escreval("Nenhuma rodada jogada ainda.")
               senao
                  // Exibe o hist�rico completo das rodadas jogadas
                  escreval("+------------------------------+")
                  escreval("�      RESULTADOS ANTERIORES   �")
                  escreval("�------------------------------�")
                  para j de 1 ate rodada faca
                     escreval("� Rodada ", j, ": ", historico[j])
                  fimpara
               fimse

            caso 4
               limpatela
               escreval("+------------------------------------------+")
               escreval("|           REGRAS DO CA�A-N�QUEIS         |")
               escreval("+------------------------------------------+")
               escreval("- Aposte um valor dentro do seu saldo.")
               escreval("- Tr�s n�meros s�o sorteados entre 1 e 9.")
               escreval("- Combina��es especiais geram multiplicadores:")

               escreval("  1-1-1 -> x3.0  (Jackpot!)")
               escreval("  2-2-2 -> x2.5  (Triplo 2!)")
               escreval("  3-3-3 -> x4.0  (Mega pr�mio!)")
               escreval("  4-4-4 -> x3.5  (Bom pr�mio!)")
               escreval("  5-5-5 -> x5.0  (Jackpot supremo!)")
               escreval("  6-6-6 -> x1.0  (Pr�mio b�sico!)")
               escreval("  7-7-7 -> x1.5  (Pr�mio m�dio!)")
               escreval("  8-8-8 -> x2.0  (Pr�mio bacana!)")
               escreval("  9-9-9 -> x1.7  (Pr�mio legal!)")
               escreval("  Trinca especial -> x3.2  (Grande pr�mio!)")
               escreval("  Dois n�meros iguais -> x1.3  (Pr�mio pequeno)")
               escreval("  Sequ�ncia 1-2-3 ou 3-2-1 -> x1.1  (Empate t�cnico)")
               escreval("  Sequ�ncia 4-5-6 ou 6-5-4 -> x1.2  (Pr�mio bacana)")
               escreval("  Nenhuma combina��o -> Perde a aposta")

               escreval("+--------------------------------------+")



            caso 5
               // Sai do cassino
               jogandoCassino := falso

            outrocaso
               escreval("Op��o inv�lida.")
            fimescolha

            // Pergunta se o jogador deseja continuar no Ca�a-N�queis
            se jogandoCassino entao
               escreval("Deseja continuar no CA�A-N�QUEIS? (S/N)")
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
            escreval("+------------------------------+")
            escreval("�         JOGO DE DADOS        �")
            escreval("�------------------------------�")
            escreval("� 1 - Jogar                    �")
            escreval("� 2 - Ver saldo                �")
            escreval("� 3 - Regras                   �")
            escreval("� 4 - Voltar ao menu           �")
            escreval("+------------------------------+")
            leia(opcaoDado)

            escolha opcaoDado
            caso 1
               limpatela
               escreval("+------------------------------+")
               escreval("�          NOVA RODADA         �")
               escreval("+------------------------------+")
               escreval("Saldo atual: R$ ", saldo:0:2)
               escreval("Digite o valor da aposta:")
               leia(aposta)

               se (aposta > saldo) ou (aposta <= 0) entao
                  escreval("Aposta inv�lida. Tente novamente.")
               senao
                  dado1 := randi(6) + 1
                  dado2 := randi(6) + 1
                  soma := dado1 + dado2

                  escreval("+------------------------------+")
                  escreval("�        RESULTADO DOS DADOS   �")
                  escreval("�------------------------------�")
                  escreval("� Dado 1: ", dado1, "                    �")
                  escreval("� Dado 2: ", dado2, "                    �")
                  escreval("� Soma dos dados: ", soma, "             �")
                  escreval("+------------------------------+")

                  se (dado1 = dado2) entao
                     escreval("Dupla! Voc� ganhou 3x a aposta!")
                     saldo := saldo + (aposta * 3)
                  senao
                     se (soma mod 2 = 0) entao
                        escreval("Soma par! Voc� ganhou o dobro!")
                        saldo := saldo + (aposta * 2)
                     senao
                        escreval("Soma �mpar! Voc� perdeu a aposta.")
                        saldo := saldo - aposta
                     fimse
                  fimse
               fimse

            caso 2
               limpatela
               escreval("+------------------------------+")
               escreval("�      SEU SALDO ATUAL �       �")
               escreval("�        R$ ", saldo:0:2, "              �")
               escreval("+------------------------------+")

            caso 3
               limpatela
               escreval("+------------------------------+")
               escreval("�    REGRAS DO JOGO DE DADOS   �")
               escreval("�------------------------------�")
               escreval("� - Voc� aposta um valor.      �")
               escreval("� - Dois dados s�o lan�ados.   �")
               escreval("� - Dupla (n�meros iguais)     �")
               escreval("�   premia 3x a aposta.        �")
               escreval("� - Soma par premia 2x.        �")
               escreval("� - Soma �mpar perde a aposta. �")
               escreval("+------------------------------+")

            caso 4
               limpatela
               escreval("Voltando ao menu principal...")
               jogandoDado := falso

            outrocaso
               limpatela
               escreval("Op��o inv�lida. Tente novamente.")
            fimescolha

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
         // Exibe a tela para o usu�rio informar o valor a depositar
         escreval("+==============================+")
         escreval("|       DEP�SITO DE SALDO      |")
         escreval("+------------------------------+")
         escreval("| Informe o valor a depositar: |")
         escreval("+------------------------------+")
         escreva("R$ ")
         leia(deposito)

         // Verifica se o valor do dep�sito � v�lido (maior que zero)
         se deposito <= 0 entao
            escreval()
            escreval("+------------------------------+")
            escreval("|  Valor inv�lido. Tente novo. |")
            escreval("+------------------------------+")
            escreval("Aperte F9 para prosseguir:")
            pausa
         senao
            // Atualiza o saldo com o valor depositado
            saldo := saldo + deposito
            escreval()
            limpatela
            // Confirma��o do dep�sito e exibe o novo saldo
            escreval("+------------------------------+")
            escreval("| Dep�sito realizado com sucesso.")
            escreval("| Saldo atual: R$ ", saldo:0:2)
            escreval("+------------------------------+")
            escreval("Aperte F9 para prosseguir:")
            pausa
         fimse

      caso 5
         limpatela
         // Pergunta ao jogador se ele realmente quer sair do cassino
         escreval("VOC� DESEJA MESMO SAIR DO CASSINO?")
         escreval("A sorte ainda gira, e os grandes n�o fogem da mesa.")
         escreval("Digite 'S' para sair ou 'N' para voltar e tentar a sorte mais uma vez.")
         leia(ctz)

         // Se o jogador confirma sa�da, faz uma �ltima confirma��o
         se ctz = "S" entao
            limpatela
            escreval("Hmm... ent�o vai correr agora?")
            escreval("Sabia que 9 em cada 10 desistentes se arrependem depois?")
            escreval("Digite 'SIM' se quiser MESMO ir embora ou qualquer outra coisa para ficar.")
            leia(decisaoFinal)

            // Se o jogador confirma a sa�da final
            se decisaoFinal = "SIM" entao
               limpatela
               escreval("Tudo bem... Mas n�o diga que a casa n�o avisou.")
               escreval("Quem foge do cassino, foge da chance de mudar de vida.")
               escreval("Voc� est� saindo... mas a porta estar� sempre aberta.")

               escreval("_________$$$___$$$")
               escreval("______ __$$$___$$$")
               escreval("_____$$$$$$$$$$$$$$$")
               escreval("___$$$ $$$$$$$$$$$$$$$$")
               escreval("__$$$$$_$$$___$$$__$$$$")
               escreval("_$$$$$__$$$___$$$")
               escreval("_$$$$$__$$$___$$$")
               escreval("_ $$$$$__$$$___$$$")
               escreval("___$$$$$$$$$$$$$$$$$$$")
               escreval("_____$$$$$ $$$$$$$$$$$$$$")
               escreval("________ $$$___$$$___$$$$$")
               escreval("________$$$___$$$____$$$$$")
               escreval("________$$$ ___$$$____$$$$$")
               escreval("_$$$$__ _$$$___$$$___$$$$$")
               escreval("__$$$$$$$$$$$$$$$$$$$$$$")
               escreval("____$$$$$$$$ $$$$$$$$$$")
               escreval("________$$$_ __$$$")
               escreval("________$$$__ _$$$")


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
            // Caso o jogador escolha n�o sair do cassino
            limpatela
            escreval("� isso a�, jogador.")
            escreval("Desistir nunca foi uma op��o para quem nasceu para vencer.")
            escreval("Aperte F9 para prosseguir:")
            pausa
         fimse

      outrocaso
         limpatela
         // Caso o usu�rio escolha uma op��o inv�lida no menu
         escreval("Op��o inv�lida.")
         escreval("Aperte F9 para prosseguir:")
         pausa
      fimescolha
   fimenquanto
fimalgoritmo