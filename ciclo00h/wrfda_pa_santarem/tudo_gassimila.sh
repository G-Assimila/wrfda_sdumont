#!/bin/bash

ano=${1}

./criardiretorios.sh ${ano}
./criarrodadas.sh ${ano}
./criarnamelist.sh ${ano}
./criarlinkgrib.sh ${ano}
./criarlinkgenbe.sh ${ano}
