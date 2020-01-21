FROM nextcloud:fpm-alpine
RUN apk add tesseract-ocr tesseract-ocr-data-deu imagemagick
ADD www.conf /usr/local/etc/php-fpm.d/www.conf
ADD policy.xml /etc/ImageMagick-7/policy.xml
