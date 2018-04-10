#!/bin/bash                                                                                                  

# get command                                                                                                
cmd="$1"

# template list                                                                                              
arr=("eleme-demo" "func-test" "routes-via-config" "simple" "ts" "user-dashboard" "with-dva" "with-redux")

# if template in list                                                                                        
if [[ "${arr[@]}" =~ $cmd ]];then
    # pull the dir we want                                                                                   
    mkdir $cmd && cd `pwd`/$cmd && git init &&
        git remote add repo https://github.com/umijs/umi.git

    git config core.sparsecheckout true &&
        echo "/examples/$cmd" >> .git/info/sparse-checkout && git pull repo master

    # clean dir                                                                                              
    mv `pwd`/examples/$cmd/* . && rm -rf examples

    # install modules                                                                                        
    ( yarn ) 2> /dev/null || npm install
else
    echo "                                                                                                   
need to pick a template in                                                                                   
" &&
        echo "${arr[*]}                                                                                      
"
fi
