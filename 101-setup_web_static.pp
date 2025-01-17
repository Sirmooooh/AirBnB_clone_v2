# configuring my web servers using puppet

$word = '<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>'

exec { 'Install and configure nginx':
  command  => 'sudo apt-get update -y &&
               sudo apt-get install nginx -y &&
               sudo mkdir -p /data/web_static/releases/test/ &&
               sudo mkdir -p /data/web_static/shared/ &&
               sudo echo $word > /data/web_static/releases/test/index.html &&
<<<<<<< HEAD
               sudo ln -sf /data/web_static/releases/test/ /data/web_static/current &&
               sudo chown -R ubuntu:ubuntu /data/ &&
               update="\\\n\tlocation /hbnb_static {\n\talias /data/web_static/current/;\n\t}" &&
=======
               sudo ln -sf /data/web_static/releases/test/ /data/web_static/current && 
               sudo chown -R ubuntu:ubuntu /data/ &&
               update="\\\n\tlocation /hbnb_static {\n\talias /data/web_static/current/;\n\t}" && 
>>>>>>> 05ff86c7f76072caddcb44113238b978abed200f
               sudo sed -i "55i $update" /etc/nginx/sites-available/default &&
               sudo service nginx restart',
  provider => 'shell',
}
