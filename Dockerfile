# Usar una imagen base de PHP con FPM
FROM php:8.0-fpm

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libonig-dev \
    libzip-dev \
    nginx \
    supervisor

# Instalar extensiones de PHP necesarias
RUN docker-php-ext-install pdo pdo_mysql mbstring zip exif pcntl bcmath gd

# Instalar Composer globalmente
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Establecer el directorio de trabajo
WORKDIR /var/www

# Copiar el contenido del proyecto al contenedor
COPY . /var/www

# Instalar las dependencias de PHP
# RUN composer install --no-dev --optimize-autoloader

# Instalar las dependencias de NPM
RUN npm install
RUN npm run build

# Configurar permisos
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Copiar archivos de configuración de Nginx y supervisord
COPY .docker/nginx.conf /etc/nginx/nginx.conf
COPY .docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Exponer el puerto 80
EXPOSE 80

# Comando para iniciar supervisord, que gestionará Nginx y PHP-FPM
CMD ["/usr/bin/supervisord"]
