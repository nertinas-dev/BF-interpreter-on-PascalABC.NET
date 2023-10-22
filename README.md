-------------------------------------------------------------------------------------------------------------------------------------------
EN | The UBF programming language has both standard BF commands and others such as the conditional statement and modules.
-------------------------------------------------------------------------------------------------------------------------------------------
Imagine you have a tape 30,000 cells long.
Using the commands < (Move one cell left) and > (Move one cell right) you can position the caret on a specific cell.
Using the commands + (Increase cell value by 1) and - (Decrease cell value by 1)
you can change the value of the cell on which the carriage is located.
The language contains commands for entering the value of the current cell (,) and outputting it (.).
With loops ([...]), you can perform the action enclosed in [] as long as the value of the current cell is not zero.
The action enclosed in {} will be executed if the cell value is not zero.
-------------------------------------------------------------------------------------------------------------------------------------------
Modules:
-------------------------------------------------------------------------------------------------------------------------------------------
Modules are files in which code can be called for execution from any other file. The modules are located in the "modules" folder.
You can create a module by creating a file with the extension ".mubf" (Module of UBF) and write your code into it, then save the file.
The module name must not include dots, backslashes, or characters that cannot appear in a file name.
You can also create a module from a program file.
To do this, you need to declare the module on a new line and on the lines following it, inserting a % sign at the beginning of the line,
and write code for the module. You must put a % sign at the beginning of each line of code for a module.
You can call the module code in any file, anywhere in the code.
To do this, you need to write "@module_name;" in the right place in the code (without quotes). For example,

module sum
% [->+<]>
++++++++++[>++++++++++<-]>>++++<@sum;.

Output: h

-------------------------------------------------------------------------------------------------------------------------------------------
File system:
-------------------------------------------------------------------------------------------------------------------------------------------
interpreter.pas is the file that executes your code.
run.txt is a file in which you can write the name of the file you need to run.
code.ubf is a standard code execution file, you can replace it with another at any time
by creating a new one in the folder with the interpreter and in run.txt write the name of this file instead of code.ubf
documentation.txt - documentation file
modules - folder with modules
-------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------
RU | В языке программирования UBF есть как стандартные BF-команды, так и другие, такие как условный оператор и модули.
-------------------------------------------------------------------------------------------------------------------------------------------
Представьте, что у вас есть лента длиной в 30000 ячеек.
С помощью команд < (Перемещение на ячейку влево) и > (Перемещение на ячейку вправо) вы можете устанавливать каретку на определенную ячейку.
Используя команды + (Увеличить занчение ячейки на 1) и - (Уменьшить значение ячейки на 1)
вы можете изменять значение ячейки, на которой стоит каретка.
В языке присутствуют команды ввода значения текущей ячейки (,) и его вывода (.).
С помощью циклов ([...]) вы можете выполнять действие, заключенное в [], пока значение текущей ячейки не равно нулю.
Действие, заключенное в {}, выполнится, если значение ячейки не равно нулю.
-------------------------------------------------------------------------------------------------------------------------------------------
Модули
-------------------------------------------------------------------------------------------------------------------------------------------
Модули - это файлы, код в которых можно вызвать для выполнения из любого другого файла. Модули находятся в папке "modules".
Создать модуль можно, создав файл с расширением ".mubf" (Module of UBF) и написать в него ваш код, затем сохранить файл.
Имя модуля не должно включать в себя символы точки, обратные слеши и символы, которые не могут находиться в названии файла.
Создать модуль можно и из программного файла. Для этого нужно объявить модуль на новой строке и на последующих за ней строках,
вставляя в начале строки знак %, написать код для модуля. В начале каждой строки кода для модуля нужно ставить знак %.
Вызвать код модуля можно в любом файле в любом месте в коде. Для этого нужно в нужном месте в коде написать "@название_модуля;"(Без кавычек). Например:

module sum
% [->+<]>
++++++++++[>++++++++++<-]>>++++<@sum;.

Выведет: h

-------------------------------------------------------------------------------------------------------------------------------------------
Система файлов:
-------------------------------------------------------------------------------------------------------------------------------------------
interpreter.pas - это файл, который выполняет ваш код.
run.txt - файл, в который вы можете написать название файла, который вам нужно выполнить.
code.ubf - стандартный файл выполнения кода, его можно в любой момент заменить на другой,
создав новый в папке с интерпретатором и в run.txt написать название этого файла вместо code.ubf
documentation.txt - файл с документацией
modules - папка с модулями
-------------------------------------------------------------------------------------------------------------------------------------------
