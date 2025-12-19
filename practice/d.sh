#!/bin/bash
root_user=$(id -u)
package=(nginx,python,java,httpd)



validation(){
if [ $1 -eq 0]
    then
    echo "installed succesfully"
    else 
    echo "not installed ..!"
    exit 1;
fi
}
#checking root user
if [ ${root_user} -ne 0]
    then
    echo "run sudo user"
    exit 1;
    else
    dnf list installed ${package}
        if [ $? -eq 0]
            then 
                echo "already installed ${package}..!"
            else 
                echo "installing ${package}..!"
                dnf install ${package} -y | tee -a ${FILEPATH}
                validation $? ${package}
        fi
fi
