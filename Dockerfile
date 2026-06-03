FROM nginx:1.29-alpine

COPY index.html robots.txt sitemap.xml og-preview.svg /usr/share/nginx/html/
