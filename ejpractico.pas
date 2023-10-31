program practico;
const
   MAX_MATERIAS = 38;
type
	   TMateria = record
		 codigo:string[6];
		 nombre:string[50];
	      end;

   TMaterias = array[1..MAX_MATERIAS] of TMateria;
    notaMaterias = record
		materia:TMateria;
		nota:integer
	end;
		alumno = record
			Nombre:string;
			aprobadas: notaMaterias;
		end;
		
listaAlumnos = ^NodoAlumnos;

	NodoAlumnos  = record
		datos: alumno;
		sig: listaAlumnos;
	end;
	

const
   MATERIAS: TMaterias = (
(codigo: 'E0228'; nombre: 'Práctica Profesional Supervisada'),
(codigo: 'E0282'; nombre: 'Electrotecnia y Electrónica'),
(codigo: 'E0301'; nombre: 'Introducción al Diseño Lógico'),
(codigo: 'E0302'; nombre: 'Introducción al Procesamiento de Señales'),
(codigo: 'E0303'; nombre: 'Redes de Datos 1'),
(codigo: 'E0304'; nombre: 'Instrumentación y Control'),
(codigo: 'E0305'; nombre: 'Circuitos Digitales y Microcontroladores'),
(codigo: 'E0306'; nombre: 'Taller de Proyecto I'),
(codigo: 'F0301'; nombre: 'Matemáticas A'),
(codigo: 'F0302'; nombre: 'Matemáticas B'),
(codigo: 'F0304'; nombre: 'Matemática C'),
(codigo: 'F0307'; nombre: 'Estadistica'),
(codigo: 'F0310'; nombre: 'Matemáticas D1'),
(codigo: 'F0312'; nombre: 'Probabilidades'),
(codigo: 'F0316'; nombre: 'Física I'),
(codigo: 'F0317'; nombre: 'Física II'),
(codigo: 'I101'; nombre: 'Programación I'),
(codigo: 'I102'; nombre: 'Programación II'),
(codigo: 'I103'; nombre: 'Programación III'),
(codigo: 'I104'; nombre: 'Taller de Lenguajes I'),
(codigo: 'I105'; nombre: 'Conceptos de Arquitectura de Computadoras'),
(codigo: 'I106'; nombre: 'Conceptos de Sistemas Operativos'),
(codigo: 'I107'; nombre: 'Taller de Lenguajes II'),
(codigo: 'I108'; nombre: 'Conceptos de Bases de Datos'),
(codigo: 'I109'; nombre: 'Taller deArquitectura'),
(codigo: 'I110'; nombre: 'Ingeniería de Software'),
(codigo: 'I111'; nombre: 'Concurrencia y Paralelismo'),
(codigo: 'I112'; nombre: 'Bases de Datos'),
(codigo: 'I113'; nombre: 'Economía y Emprendedorismo'),
(codigo: 'I114'; nombre: 'Redes de Datos II'),
(codigo: 'I115'; nombre: 'Sistemas de Tiempo Real'),
(codigo: 'I116'; nombre: 'Sistemas Distribuidos y Paralelos'),
(codigo: 'I117'; nombre: 'Aspectos Legales de Ingeniería Informática'),
(codigo: 'I118'; nombre: 'Taller de Proyecto II'),
(codigo: 'INFIN'; nombre: 'Inglés (Prueba de Suficiencia)'),
(codigo: 'M0670'; nombre: 'Sistemas de Representación'),
(codigo: 'S0012'; nombre: 'Seminario de Redacción de Textos Profesionales'),
(codigo: 'U0902'; nombre: 'Química')
);
function searchMateria(M: Tmaterias; codigo: String):String;
var
	a,b,i:integer;
begin
	i:=0;
	a:=0;

	b:=MAX_MATERIAS;
	repeat
		i:=(a+b) div 2;
		if (m[i].codigo = codigo) then begin  
		searchMateria:= m[i].nombre; break end
		else if (m[i].codigo < codigo) then a:= i+1
		else if (m[i].codigo > codigo) then b:= i-1
		else begin searchMateria:= ''; break;
	end;
	until(a>b);
end;

function materiaExiste(materia:string):boolean;
begin
	if (searchMateria(MATERIAS,materia) <> '') then materiaExiste:=TRUE else materiaExiste:= FALSE;
end;


procedure insertarNodo(var lista:listaAlumnos;Datos:alumno);
var ant, act, nue:listaAlumnos;

begin
new(nue);
nue^.datos.nombre:=Datos.nombre;
ant:= lista;
act:=lista;
while (act<>NIL) and (act^.datos.nombre < Datos.nombre) do
	begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act = ant) then lista:= nue else ant^.sig:= nue;
	nue^.sig:=act;
end;

procedure agregarArray(var vector:TMaterias;var dimLogica:integer;var exito:boolean;Datos:Tmateria);
begin
if dimLogica < MAX_MATERIAS then
	begin
		dimLogica:= dimLogica + 1;
		vector[dimLogica]:= datos;
		exito:=TRUE;
		end
		else 
		exito:=FALSE;

end;

procedure GenerarLista(var lista:listaAlumnos);
var
	Datos:alumno; 
	i,aprobadas,dimLogica:integer;
	codigoMateria:codigo;
begin
	writeln('inserte nombre del alumno');
	readln(Datos.nombre);
	writeln('inserte cantidad de materias aprobadas');
	readln(aprobadas);
for i:=0 to aprobadas do
	begin
	dimLogica:=0
	writeln('inserte codigo de materia');
	readln(codigoMateria);
	
	end

end;



var 
a,inp: String;
begin
	writeln('codigo de materia:');
	readln(inp);
	writeln(materiaExiste(inp));
a:=searchMateria(MATERIAS,inp);
writeln(a);

end.
