Askarallouse

Se trata de desarrollar una aplicación web que implemente un tablero de preguntas y respuestas al estilo StackOverflow. Básicamente, la aplicación web deberá permitir el registro y login de usuarios, además de realizar, buscar, votar y responder preguntas.

¿Qué es esto?

Este proyecto está destinado como desarrollo para la clase de Tecnologías de Servicio Web, en la ESEI. Al final de su desarrollo, se espera que sea usable y se pueda hacer funcionar en cualquier servidor web que cumpla una serie de condiciones.

¿Como hacerlo funcionar?

Solo necesitas descargar el contenido del repositorio en tu servidor web y realizar la instalación de la base de datos, usando el script que ubicado bajo database-setup/ cuando esté terminado.

git clone https://github.com/Mascalerino/Askarallouse.git

Crear la base de datos Askarakllouse en tu servidor mysql y ejecutar:

cd Askarakllouse

mysql -u user -p < setup/setup.sql

sh setup/setup.sh

