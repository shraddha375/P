#!/bin/csh -f

if ( `pwd` != "/home/ecegrid/a/595m04/shraddha/Personal/new_protocompiler/mia_mod_2/mia_8bit8bit_add" ) then
  echo "Warning: Working directory is changed."
  echo "Executing the postelab script in the same working directory is recommended."
  echo "    Previous path: /home/ecegrid/a/595m04/shraddha/Personal/new_protocompiler/mia_mod_2/mia_8bit8bit_add"
  echo "    Current path: `pwd`"
  echo ""
endif

cd /home/ecegrid/a/595m04/shraddha/Personal/new_protocompiler/mia_mod_2/mia_8bit8bit_add
/bin/sh -f simv.daidir/.elabcomCmd

set ELABCOM_STATUS=0;
set CONTENT=`cat simv.daidir/.elabcomReport`;
if ( `echo ${CONTENT} | grep -w "Success" ` != 0 ) then
    set VERDI_SUM_MSG="Verdi KDB elaboration done and the database successfully generated"
else if ( `echo ${CONTENT} | grep -w "Fail" ` != 0 ) then
    set VERDI_SUM_MSG="Verdi KDB elaboration done and the database not generated"
else
    set VERDI_SUM_MSG="Verdi KDB elaboration is skipped because design is not changed"
    set ELABCOM_STATUS=1;
endif
echo "${VERDI_SUM_MSG}."
