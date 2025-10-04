  #!/bin/bash
        echo "Preparing for installation of packages"

        set -e
        sudo yum update -y
        sudo yum install wget unzip httpd -y
        sudo systemctl start httpd
        sudo systemctl enable httpd

        wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip
        unzip 2137_barista_cafe.zip
        sudo cp -r 2137_barista_cafe/* /var/www/html/

        sudo systemctl restart httpd
        echo "Installation complete"