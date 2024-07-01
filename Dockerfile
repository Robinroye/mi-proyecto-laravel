# Usar una imagen base de PHP con FPM
FROM php:8.3-fpm

# Instalar dependencias del sistema
RUN apk update && apk add --no-cache \
    nodejs npm \
    build-base \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    oniguruma-dev \
    libzip-dev \
    nginx \
    supervisor

# Instalar extensiones de PHP necesarias
RUN docker-php-ext-install pdo pdo_mysql mbstring zip exif pcntl bcmath gd

# Descargar e instalar Composer manualmente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

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

# Crear directorios de logs y configurar permisos
RUN mkdir -p /var/log/nginx /var/log/php-fpm
RUN chown -R www-data:www-data /var/log/nginx /var/log/php-fpm

# Copiar archivos de configuración de Nginx y supervisord
COPY .docker/nginx.conf /etc/nginx/nginx.conf
COPY .docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Exponer el puerto 80
EXPOSE 80

# Comando para iniciar supervisord, que gestionará Nginx y PHP-FPM
CMD ["/usr/bin/supervisord"]
