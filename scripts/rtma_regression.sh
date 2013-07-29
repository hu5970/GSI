#!/bin/sh

set -x

. $(awk '{ print $1 }' regression_var.out)

#. /scratch1/portfolios/NCEPDEV/da/save/$LOGNAME/EXP-regtests/scripts/regression_var.sh
#. regression_var.sh

if [[ "$arch" = "Linux" ]]; then

   # Submit jobs using sub wrapper.

   /bin/sh sub_zeus -j $rtma_updat_exp1 -t 0:15:00 -p 2/5/0 $scripts/rtma.sh

   while [[ $(grep -c '+ rc=0' ${rtma_updat_exp1}.out) -ne 1 ]]; do
      grep '+ rc=' ${rtma_updat_exp1}.out > return_code_rtma.out
      if [ -s return_code_rtma.out ]; then
         if [[ $(stat -c %s return_code_rtma.out) -ne '0' ]]; then
            if [[ $(awk '{ print $2 }' return_code_rtma.out) -ne 'rc=0' ]]; then
               echo $rtma_updat_exp1" job has failed with return code of "$(awk '{ print $2 }' return_code_rtma.out)"."
               rm -f return_code_rtma.out
               exit
            fi
         fi
      fi
      echo "Job "$rtma_updat_exp1" is not complete yet.  Will recheck in a minute."
      sleep 60
   done

   rm -f return_code_rtma.out

   /bin/sh sub_zeus -j $rtma_updat_exp2 -t 0:12:00 -p 4/5/0 $scripts/rtma.sh

   while [[ $(grep -c '+ rc=0' ${rtma_updat_exp2}.out) -ne 1 ]]; do
      grep '+ rc=' ${rtma_updat_exp2}.out > return_code_rtma.out
      if [ -s return_code_rtma.out ]; then
         if [[ $(stat -c %s return_code_rtma.out) -ne '0' ]]; then
            if [[ $(awk '{ print $2 }' return_code_rtma.out) -ne 'rc=0' ]]; then
               echo $rtma_updat_exp2" job has failed with return code of "$(awk '{ print $2 }' return_code_rtma.out)"."
               rm -f return_code_rtma.out
               exit
            fi
         fi
      fi
      echo "Job "$rtma_updat_exp2" is not complete yet.  Will recheck in a minute."
      sleep 60
   done

   rm -f return_code_rtma.out

   /bin/sh sub_zeus -j $rtma_contrl_exp1 -t 0:12:00 -p 2/5/0 $scripts/rtma.sh

   while [[ $(grep -c '+ rc=0' ${rtma_contrl_exp1}.out) -ne 1 ]]; do
      grep '+ rc=' ${rtma_contrl_exp1}.out > return_code_rtma.out
      if [ -s return_code_rtma.out ]; then
         if [[ $(stat -c %s return_code_rtma.out) -ne '0' ]]; then
            if [[ $(awk '{ print $2 }' return_code_rtma.out) -ne 'rc=0' ]]; then
               echo $rtma_contrl_exp1" job has failed with return code of "$(awk '{ print $2 }' return_code_rtma.out)"."
               rm -f return_code_rtma.out
               exit
            fi
         fi
      fi
      echo "Job "$rtma_contrl_exp1" is not complete yet.  Will recheck in a minute."
      sleep 60
   done

   rm -f return_code_rtma.out

   /bin/sh sub_zeus -j $rtma_contrl_exp2 -t 0:12:00 -p 4/5/0 $scripts/rtma.sh

   while [[ $(grep -c '+ rc=0' ${rtma_contrl_exp2}.out) -ne 1 ]]; do
      grep '+ rc=' ${rtma_contrl_exp2}.out > return_code_rtma.out
      if [ -s return_code_rtma.out ]; then
         if [[ $(stat -c %s return_code_rtma.out) -ne '0' ]]; then
            if [[ $(awk '{ print $2 }' return_code_rtma.out) -ne 'rc=0' ]]; then
               echo $rtma_contrl_exp2" job has failed with return code of "$(awk '{ print $2 }' return_code_rtma.out)"."
               rm -f return_code_rtma.out
               exit
            fi
         fi
      fi
      echo "Job "$rtma_contrl_exp2" is not complete yet.  Will recheck in a minute."
      sleep 60
   done

   rm -f return_code_rtma.out

   /bin/sh $scripts/regression_test.sh $rtma_updat_exp1 $rtma_updat_exp2 $rtma_contrl_exp1 $rtma_contrl_exp2 tmpreg_rtma $rtma_regression 10 10 2

   rm -f rtma.out

   exit

elif [[ "$arch" = "AIX" ]]; then

   # Submit jobs using sub wrapper.

   /bin/sh sub -a RDAS-T2O -g $group -j $rtma_updat_exp1 -q $queue -p 10/1/N -r 110/1 -t 0:10:00 $scripts/rtma.sh

   while [[ $(grep -c '+ rc=0' ${rtma_updat_exp1}.out) -ne 1 ]]; do
      grep '+ rc=' ${rtma_updat_exp1}.out > return_code_rtma.out
      if [ -s return_code_rtma.out ]; then
         if [[ $(stat -c %s return_code_rtma.out) -ne '0' ]]; then
            if [[ $(awk '{ print $2 }' return_code_rtma.out) -ne 'rc=0' ]]; then
               echo $rtma_updat_exp1" job has failed with return code of "$(awk '{ print $2 }' return_code_rtma.out)"."
               rm -f return_code_rtma.out
               exit
            fi
         fi
      fi
      echo "Job "$rtma_updat_exp1" is not complete yet.  Will recheck in a minute."
      sleep 60
   done

   rm -f return_code_rtma.out
   /bin/sh sub -a RDAS-T2O -g $group -j $rtma_updat_exp2 -q $queue -p 20/1/N -r 110/1 -t 0:10:00 $scripts/rtma.sh

   while [[ $(grep -c '+ rc=0' ${rtma_updat_exp2}.out) -ne 1 ]]; do
      grep '+ rc=' ${rtma_updat_exp2}.out > return_code_rtma.out
      if [ -s return_code_rtma.out ]; then
         if [[ $(stat -c %s return_code_rtma.out) -ne '0' ]]; then
            if [[ $(awk '{ print $2 }' return_code_rtma.out) -ne 'rc=0' ]]; then
               echo $rtma_updat_exp2" job has failed with return code of "$(awk '{ print $2 }' return_code_rtma.out)"."
               rm -f return_code_rtma.out
               exit
            fi
         fi
      fi
      echo "Job "$rtma_updat_exp2" is not complete yet.  Will recheck in a minute."
      sleep 60
   done

   rm -f return_code_rtma.out
   /bin/sh sub -a RDAS-T2O -g $group -j $rtma_contrl_exp1 -q $queue -p 10/1/N -r 110/1 -t 0:10:00 $scripts/rtma.sh

   while [[ $(grep -c '+ rc=0' ${rtma_contrl_exp1}.out) -ne 1 ]]; do
      grep '+ rc=' ${rtma_contrl_exp1}.out > return_code_rtma.out
      if [ -s return_code_rtma.out ]; then
         if [[ $(stat -c %s return_code_rtma.out) -ne '0' ]]; then
            if [[ $(awk '{ print $2 }' return_code_rtma.out) -ne 'rc=0' ]]; then
               echo $rtma_contrl_exp1" job has failed with return code of "$(awk '{ print $2 }' return_code_rtma.out)"."
               rm -f return_code_rtma.out
               exit
            fi
         fi
      fi
      echo "Job "$rtma_contrl_exp1" is not complete yet.  Will recheck in a minute."
      sleep 60
   done

   rm -f return_code_rtma.out
   /bin/sh sub -a RDAS-T2O -g $group -j $rtma_contrl_exp2 -q $queue -p 20/1/N -r 110/1 -t 0:10:00 $scripts/rtma.sh

   while [[ $(grep -c '+ rc=0' ${rtma_contrl_exp2}.out) -ne 1 ]]; do
      grep '+ rc=' ${rtma_contrl_exp2}.out > return_code_rtma.out
      if [ -s return_code_rtma.out ]; then
         if [[ $(stat -c %s return_code_rtma.out) -ne '0' ]]; then
            if [[ $(awk '{ print $2 }' return_code_rtma.out) -ne 'rc=0' ]]; then
               echo $rtma_contrl_exp2" job has failed with return code of "$(awk '{ print $2 }' return_code_rtma.out)"."
               rm -f return_code_rtma.out
               exit
            fi
         fi
      fi
      echo "Job "$rtma_contrl_exp2" is not complete yet.  Will recheck in a minute."
      sleep 60
   done

   rm -f return_code_rtma.out
   /bin/sh $scripts/regression_test.sh $rtma_updat_exp1 $rtma_updat_exp2 $rtma_contrl_exp1 $rtma_contrl_exp2 tmpreg_rtma $rtma_regression 10 10 2

   rm -f rtma.out

   exit

fi