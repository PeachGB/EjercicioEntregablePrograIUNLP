program practico;
const
   MAX_MATERIAS = 38;
type
	   TMateria = record
		 codigo:string[6];
		 nombre:string[50];
	      end;

   TMaterias = array[1..MAX_MATERIAS] of TMateria;

    notaMateria = record
		materia:TMateria;
		nota:integer
	end;

   Taprobadas = array[1..MAX_MATERIAS] of notaMateria;
		alumno = record
			Nombre:string;
			aprobadas:Taprobadas;
			dimLogica:integer;
			promedio:integer;
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
nue^.datos:=Datos;
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

procedure agregarArray(var vector:Taprobadas;var dimLogica:integer;Datos:notaMateria);
begin
if dimLogica < MAX_MATERIAS then
	begin
		dimLogica:= dimLogica + 1;
		vector[dimLogica]:= datos;
		end
		else writeln('no se puede agregar al vector') 

end;

procedure GenerarLista(var lista:listaAlumnos);
var
	Datos:alumno; 
	i,aprobadas,dimLogica,nota:integer;
	Materia:notaMateria;
	promedio:integer;
begin
	Datos.nombre:='';
	while (datos.nombre <> 'zzz') do
		begin
			promedio:= 0;
			writeln('inserte nombre del alumno');
			readln(Datos.nombre);
			if datos.nombre = 'zzz' then break;
			writeln('inserte cantidad de materias aprobadas');
			readln(aprobadas);
		for i:=1 to aprobadas do
			begin
				dimLogica:=0;
				materia.materia.codigo:='';
				writeln('inserte codigo de materia');
				readln(Materia.materia.codigo);
				while not materiaExiste(materia.materia.codigo) do
					begin		
						writeln('porfavor inserte un codigo valido');	
						readln(materia.materia.codigo);
					end;
				materia.materia.nombre:= searchMateria(MATERIAS,materia.materia.codigo);
				writeln('inserte nota de la materia:',searchMateria(MATERIAS,materia.materia.codigo));
				readln(nota);
				materia.nota:= nota;
				promedio:= promedio + nota;
				agregarArray(Datos.aprobadas,dimLogica,materia);
			end;

			datos.dimLogica:=dimLogica;
			promedio:=promedio div aprobadas;
			Datos.promedio:= promedio;
		insertarNodo(lista,Datos);
		end;
end;

procedure mejorMateria(var mejorMateria:notaMateria;materias:Taprobadas;dimLogica:integer);
var 
i:integer;
max:notaMateria;
begin
	
	max:=materias[1];
	for i:= 1 to dimLogica do
		begin
			if (materias[i].nota < max.nota) then max:= materias[i];
		end;
		mejorMateria:=max
	end;

procedure recorrerLista(lista:listaAlumnos);
var mMateria:notaMateria;
begin
	while (lista <> nil) do
		begin 
			writeln(lista^.datos.nombre);
			writeln(lista^.datos.promedio);
			mejorMateria(mMateria,lista^.datos.aprobadas,lista^.datos.dimLogica);
			writeln(mMateria.materia.codigo);
			writeln(mMateria.materia.nombre);
			writeln(mMateria.nota);
			dispose(lista);
			lista:= lista^.sig;

	end;
end;


var
listaA:listaAlumnos;
begin
GenerarLista(listaA);
recorrerLista(listaA);

end.
