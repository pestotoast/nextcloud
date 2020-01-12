FROM nextcloud:fpm-alpine
RUN apk add tesseract-ocr tesseract-ocr-data-deu
ADD www.conf /usr/local/etc/php-fpm.d/www.conf