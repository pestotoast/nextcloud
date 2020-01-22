FROM nextcloud:fpm-alpine
RUN apk add tesseract-ocr tesseract-ocr-data-deu imagemagick
ADD www.conf /usr/local/etc/php-fpm.d/www.conf
ADD https://github.com/tesseract-ocr/tessdata_fast/raw/master/deu.traineddata /usr/share/tessdata/deu.traineddata
ADD https://github.com/tesseract-ocr/tessdata_fast/raw/master/eng.traineddata /usr/share/tessdata/eng.traineddata
ADD policy.xml /etc/ImageMagick-7/policy.xml
