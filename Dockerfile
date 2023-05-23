FROM node:16-alpine

WORKDIR /app

# Copio package.json y package-lock.json al directorio /app
COPY package.json  ./
# Instalo las dependencias
RUN npm config set unsafe-perm true && npm install && npm config set unsafe-perm false

# Copio el resto de ficheros del proyecto a la imagen
COPY .

EXPOSE 5173
# Inicio la aplicacion. uso dev ya que es el que esta indicado en package.json,
#y la opcion --host para que se pueda acceder desde fuera del contenedor.
CMD npm run dev -- --host
