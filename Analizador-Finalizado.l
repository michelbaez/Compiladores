import java.util.*;
import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;

%%
%class Lexer
%int 
//Definimos las expresiones regulares
//Identificadores
	Letra =[a-zA-Z]
	Digito=[0-9]
	Letra_Compuesta=({Letra}|\_)
	Identificador = {Letra}({Letra_Compuesta}|{Digito})*

//Enteros
	Enteros ={Digito}+([_]{Digito}+)?

//Exponentes
	exponente = ([eE][+-]?{Enteros}+)

//Decimales
Dig_decimal = ((({Entero})*\.({Digito})+|({Entero})+\.({Digito})*){exponente}?)|({Entero})+({exponente})

//Imaginarios
Imaginario = ({Entero}|{Dig_Decimal})+'i'

//Cadenas
Cadenas=("[^']*")

//Constantes booleanas
Booleanas = (True|False)

//op_aritmetico =("*"|"/"|"%"|"+"|"-")

//op_unario
op_unario=("--"|"++")

//Operadores de Asignacion 
op_asignacion    =\=
op_sum_izq_asig  =\+=
op_res_izq_asig  =\-=
op_mul_izq_asig  =\*=
op_divi_izq_asig =\/=
op_pot_izq_asig  =\^=
op_mod_izq_asig  =\%=

//Operador Relacional
op_igual_que = "=="
op_diferente_que ="!="
op_menor_que = "<"
op_menor_igual_que = "<="
op_mayor_que = ">"
op_mayor_igual_que = ">="

//Operador Logico
op_and_logico ="&&"
op_or_logico="||"	

//Operador Shift
op_desplazo_derecha =">>"
op_desplazo_izquierda ="<<"

//Operadores paréntesis
parentesis_abre   = \(
parentesis_cierra = \)

op=({op_aritmetico}|{op_unario}|{op_asignacion}|{op_sum_izq_asig}|{op_res_izq_asig}|{op_mul_izq_asig}|{op_divi_izq_asig}|{op_pot_izq_asig}|{op_mod_izq_asig}|{op_igual_que}|{op_diferente_que}|{op_menor_que}|{op_menor_igual_que}|{op_mayor_que}|{op_mayor_igual_que}|{op_and_logico}|{op_or_logico}|{op_desplazo_derecha}|{op_desplazo_izquierda}|{parentesis_abre}|{parentesis_cierra})

//Palabras reservadas

p_reservada=(print|delete|main|public|static|void|abstract|assert|boolean|break|byte|case|catch|char|class|conts|continue|default|do|double|else|export|extends|for|if|new|package|private|protected|public|return|short|static|super|switch|this|throws|void|volatile|var|goto)
//Terminamos expresiones regulares




public static final int Identificador =0, Enteros=1,exponente=2,Dig_decimal=3;
public static final int Imaginario =4, Cadenas=5,Booleanos=6,op_aritmetico=7;
public static final int op_unario =8, op_asignacion=9,op_sum_izq_asig=10;
public static final int op_res_izq_asig=11, op_mul_asig_izq =12, op_divi_izq_asig=13;
public static final int op_pot_izq_asig=14, op_mod_izq_asig=15, op_igual_que =16;
public static final int op_diferente_que =17 ,op_menor_que =18;
public static final int op_menor_igual_que=19, op_mayor_que=20;
public static final int op_mayor_igual_que=21 , op_and_logico=22;
public static final int op_or_logico=23, op_desplazo_derecha =24;
public static final int op_desplazo_izquierda =25, parentesis_abre=26;
public static final int parentesis_cierra =27, op=28, p_reservada=29;

public static void main (String[] args){
	Lexer lexer = new lexer();
		try{
			br = new BufferedReader( new FileReader (new File(args[0])));
			lexer.yylex();
		} catch (IOException e){
			System.out.println("El archivo no se pudo abrir");
		}
	}
%}

%eofval{
		return 0;
%eofval}

%{
	public string lexeme;
%}

{esps}{/*ignorar*/}
{Enteros}{System.out.println(Enteros);}
{exponentes}{System.out.println(exponentes);}
{Dig_decimal}{System.out.println(Dig_decimal);}
{Imaginario}{System.out.println(Imaginario);}
{Cadenas}{System.out.println(Cadenas);}
{Booleanos}{Syste.out.println(Booleanos);}
{op_aritmetico}{Syste.out.println(op_aritmetico);}
{op_unario}{Syste.out.println(op_unario);}
{op_asignacion}{Syste.out.println(op_asignacion);}
{op_sum_izq_asig}{Syste.out.println(op_sum_izq_asig);}
{op_res_izq_asig}{Syste.out.println(op_res_izq_asig);}
{op_mul_izq_asig}{Syste.out.println(op_mul_izq_asig);}
{op_divi_izq_asig}{Syste.out.println(op_divi_izq_asig);}
{op_pot_izq_asig}{Syste.out.println(op_pot_izq_asig);}
{op_mod_izq_asig}{Syste.out.println(op_mod_izq_asig);}
{op_igual_que}{Syste.out.println(op_igual_que);}
{op_diferente_que}{Syste.out.println(op_diferente_que);}
{op_menor_que}{Syste.out.println(op_menor_que);}
{op_menor_igual_que}{Syste.out.println(op_menor_igual_que);}
{op_mayor_que}{Syste.out.println(op_mayor_que);}
{op_mayor_igual_que}{Syste.out.println(op_mayor_igual_que);}
{op_and_logico}{Syste.out.println(op_and_logico);}
{op_o_logico}{Syste.out.println(op_o_logico);}
{op_desplazo_derecha}{Syste.out.println(op_desplazo_derecha);}
{op_desplazo_izquierda}{Syste.out.println(op_desplazo_izquierda);}
{parentesis_abre}{Syste.out.println(parentesis_abre);}
{parentesis_cierra}{Syste.out.println(parentesis_cierra);}
{p_reservada}{Syste.out.println(p_reservada);}
