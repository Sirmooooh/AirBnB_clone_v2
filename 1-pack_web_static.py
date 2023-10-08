#!/usr/bin/python3
<<<<<<< HEAD
from fabric.api import local
from datetime import datetime


def do_pack():
    """A script that generates a .tgz archive from the contents
    of the web_static folder"""
    now = datetime.now()
    time_str = now.strftime("%Y%m%d%H%M%S")
    archive_name = "versions/web_static_{}.tgz".format(time_str)
    try:
        local("mkdir -p versions")
        local("tar -czvf {} web_static".format(archive_name))
        return (archive_name)
    except Exception:
        return None
=======
#  Fabric script that generates a .tgz archive from the
# contents of the web_static folder of your AirBnB Clone repo
# using the function do_pack
import os.path
from datetime import datetime
from fabric.api import local


def do_pack():
    """Create a tar gzipped archive of the directory web_static."""
    dt = datetime.utcnow()
    file = "versions/web_static_{}{}{}{}{}{}.tgz".format(dt.year,
                                                         dt.month,
                                                         dt.day,
                                                         dt.hour,
                                                         dt.minute,
                                                         dt.second)
    if os.path.isdir("versions") is False:
        if local("mkdir -p versions").failed is True:
            return None
    if local("tar -cvzf {} web_static".format(file)).failed is True:
        return None
   return file
>>>>>>> 9db69a5622ce3505e96f160ca8f62b5ebe8dd509
