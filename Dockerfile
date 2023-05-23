FROM node:16-alpine
USER 1001
RUN mkdir -p /app
WORKDIR /app

RUN chmod 775 /app
# Copio package.json y package-lock.json al directorio /app
COPY package.json  ./
# Instalo las dependencias
RUN npm install

# Copio el resto de ficheros del proyecto a la imagen
COPY . .


EXPOSE 5173

# Inicio la aplicacion. uso dev ya que es el que esta indicado en package.json,
#y la opcion --host para que se pueda acceder desde fuera del contenedor.
CMD npm run dev -- --host
