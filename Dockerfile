FROM node:16-alpine
WORKDIR /app

# Copio package.json y package-lock.json al directorio /app
USER 0
COPY package.json  ./
RUN chown -R 1001:0 /app
# Instalo las dependencias
RUN npm install

# Copio el resto de ficheros del proyecto a la imagen
COPY . .


EXPOSE 5173

# Inicio la aplicacion. uso dev ya que es el que esta indicado en package.json,
#y la opcion --host para que se pueda acceder desde fuera del contenedor.
CMD npm run dev -- --host
