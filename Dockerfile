FROM drupal:latest

COPY setup.sh /usr/local/bin/setup.sh 
RUN chmod +x /usr/local/bin/setup.sh  
CMD ["setup.sh"]