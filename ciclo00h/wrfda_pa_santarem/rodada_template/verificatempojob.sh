#!/bin/bash

jobid=${1}

sacct -j ${jobid} --format="elapsed"
