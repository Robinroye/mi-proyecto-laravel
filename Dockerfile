# Usar una imagen base de PHP con FPM
FROM php:8.3-fpm

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y nginx supervisor

# Crear directorios de logs
RUN mkdir -p /var/log/nginx /var/log/php-fpm

# Configurar permisos
RUN chown -R www-data:www-data /var/log/nginx /var/log/php-fpm

# Establecer el directorio de trabajo
WORKDIR /var/www

# Copiar el contenido del proyecto al contenedor
COPY . /var/www

# Instalar las dependencias de PHP
RUN composer install --no-dev --optimize-autoloader

# Instalar las dependencias de NPM
RUN npm install
RUN npm run build

# Configurar permisos
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Copiar archivos de configuración de Nginx y supervisord
COPY .docker/nginx.conf /etc/nginx/nginx.conf
COPY .docker/default.conf /etc/nginx/sites-enabled/default
COPY .docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Exponer el puerto 80
EXPOSE 80

# Comando para iniciar supervisord, que gestionará Nginx y PHP-FPM
CMD ["/usr/bin/supervisord"]
