programa
{
	
	inteiro controlePosicoes[9] = {0,0,0,0,0,0,0,0,0}
	caracter tabuleiro[5][11] = {{' ',' ',' ','|',' ',' ',' ','|',' ',' ',' '},{'=','=','=','|','=','=','=','|','=','=','='},{' ',' ',' ','|',' ',' ',' ','|',' ',' ',' '},{'=','=','=','|','=','=','=','|','=','=','='},{' ',' ',' ','|',' ',' ',' ','|',' ',' ',' '}}
	
	funcao imprimeTabuleiro() //imprime o tabuleiro de acordo com estado atual
	{
		inteiro linTab = 0, colTab = 0
		escreva("\n")
		para (linTab=0;linTab<=4;linTab++)
		{
			para (colTab=0;colTab<=10;colTab++)
			{
				escreva(tabuleiro[linTab][colTab])
				
			}
			escreva("\n")
		}
	}

	funcao imprimePosicoes() //verificar preenchimento do vetor de controle de jogadas
	{
		escreva("vetor de posições ocupadas: ")
		para (inteiro i=0;i<9;i++)
		{
			escreva(controlePosicoes[i]+" ")
		}
		escreva("\n")
	}

	funcao imprimeApresentacao()
	{
		escreva (" oo                                     dP          \n                                        88          \n dP .d8888b. .d8888b. .d8888b.    .d888b88 .d8888b. \n 88 88'  `88 88'  `88 88'  `88    88'  `88 88'  `88 \n 88 88.  .88 88.  .88 88.  .88    88.  .88 88.  .88 \n 88 `88888P' `8888P88 `88888P'    `88888P8 `88888P8 \n 88               .88                               \nd8P           d8888P                                \n                   dP dP                            \n                   88 88                    dP dP   \n dP   .dP .d8888b. 88 88d888b. .d8888b.    8888888  \n 88   d8' 88ooood8 88 88'  `88 88'  `88     88 88   \n 88 .88'  88.  ... 88 88    88 88.  .88    8888888  \n 8888P'   `88888P' dP dP    dP `88888P8     dP dP   \n")
	}
	
	funcao logico verificaPosicao(inteiro posicao) //posicao está livre?
	{
		se (controlePosicoes[posicao]==0)
		{
			retorne verdadeiro //sim, a posição esta livre!
		}
		senao
		{
			escreva ("A posição #"+(posicao+1)+" já está ocupada!\n")
			retorne falso //não, a posição já foi ocupada!
		}
	}

	funcao jogada (inteiro jogador) //realiza a jogada, preenchendo o vetor de posiçoes e a matriz do tabuleiro
	{
		inteiro selecionaPosicao = 0
		caracter simbolo=' '
		se (jogador==1)
		{
			simbolo='X'
		}
		senao
		{
			simbolo='O'
		}
		faca 
			{
				imprimePosicoes()
				imprimeTabuleiro()
				escreva ("\nlegenda\n 1|2|3\n 4|5|6\n 7|8|9")
				escreva ("\n\njogador: "+jogador+", selecione a posição para jogada: ")
				leia (selecionaPosicao)
				selecionaPosicao=selecionaPosicao-1 //ajuste para o vetor de 9 posiçoes => 0-8
				escreva("Posição no vetor: "+selecionaPosicao+"\n")
				
			} enquanto (verificaPosicao(selecionaPosicao)==falso)
			
			controlePosicoes[selecionaPosicao]=jogador
			atualizaTabela(selecionaPosicao,simbolo)
	}

	funcao atualizaTabela(inteiro posicao, caracter simbolo)
	{
		posicao+=1
		escolha (posicao)
		{
			caso 1: 
				tabuleiro[0][1]=simbolo
			pare
			caso 2:
				tabuleiro[0][5]=simbolo
			pare
			caso 3:
				tabuleiro[0][9]=simbolo
			pare
			caso 4:
				tabuleiro[2][1]=simbolo
			pare
			caso 5:
				tabuleiro[2][5]=simbolo
			pare
			caso 6:
				tabuleiro[2][9]=simbolo
			pare
			caso 7:
				tabuleiro[4][1]=simbolo
			pare
			caso 8:
				tabuleiro[4][5]=simbolo
			pare
			caso 9:
				tabuleiro[4][9]=simbolo
			pare
		}
	}

	funcao inteiro vitoria()
	{
		//condiçoes de vitoria???
		se ((controlePosicoes[0]==controlePosicoes[1])e(controlePosicoes[0]==controlePosicoes[2])e(controlePosicoes[0]!=0)) //linha1
		{
			retorne controlePosicoes[0]
		}
		senao se ((controlePosicoes[3]==controlePosicoes[4])e(controlePosicoes[3]==controlePosicoes[5])e(controlePosicoes[3]!=0)) //linha2
		{
			retorne controlePosicoes[3]
		}
		senao se ((controlePosicoes[6]==controlePosicoes[7])e(controlePosicoes[6]==controlePosicoes[8])e(controlePosicoes[6]!=0)) //linha3
		{
			retorne controlePosicoes[6]
		}
		senao se ((controlePosicoes[0]==controlePosicoes[3])e(controlePosicoes[0]==controlePosicoes[6])e(controlePosicoes[0]!=0)) //coluna1
		{
			retorne controlePosicoes[0]
		}
		senao se ((controlePosicoes[1]==controlePosicoes[4])e(controlePosicoes[1]==controlePosicoes[7])e(controlePosicoes[1]!=0)) //coluna2
		{
			retorne controlePosicoes[1]
		}
		senao se ((controlePosicoes[2]==controlePosicoes[5])e(controlePosicoes[2]==controlePosicoes[8])e(controlePosicoes[2]!=0)) //coluna3
		{
			retorne controlePosicoes[2]
		}
		senao se ((controlePosicoes[0]==controlePosicoes[4])e(controlePosicoes[0]==controlePosicoes[8])e(controlePosicoes[0]!=0)) //diagonal1
		{
			retorne controlePosicoes[0]
		}
		senao se ((controlePosicoes[2]==controlePosicoes[4])e(controlePosicoes[2]==controlePosicoes[6])e(controlePosicoes[2]!=0)) //diagonal2
		{
			retorne controlePosicoes[2]
		}
		retorne 0
	}
	
	funcao exibeResultado(inteiro vencedor)
	{
		escolha(vencedor)
		{
			caso 1:
				escreva("\nVENCEDOR: JOGADOR 'X'")
				pare
			caso 2:
				escreva("\nVENCEDOR: JOGADOR 'O'")
				pare
			caso contrario:
				escreva("\nDEU VELHA!")	
		}
	}
	
	funcao inicio()
	{
		inteiro selecionaPosicao = 0, controleJogo = 0, vencedor=0
		inteiro posJ1 = 1, posJ2 = 2
		cadeia enter
		imprimeApresentacao()
		escreva ("\n\n           pressione <ENTER> para jogar")
		leia(enter)
		limpa()
		
		enquanto (controleJogo < 9 e (vencedor==0)) //nove jogadas ou quando alguem ganha (a partir da quinta jogada)
		{
			se (controleJogo%2==0)
			{
				jogada(posJ1)	
			}
			senao
			{
				jogada(posJ2)	
			}
			imprimePosicoes()
			vencedor=vitoria()
			controleJogo++
			limpa()
		}
		
		imprimeTabuleiro()
		exibeResultado(vencedor)
	}
}
