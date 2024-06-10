#!/bin/bash

jobid=${1}

sacct -j ${jobid} --format="JobID, JobName, Elapsed, Partition, Account, AllocCPUS, State, ExitCode" 
