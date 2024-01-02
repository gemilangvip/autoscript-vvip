#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�ղ  �� 0H���?��/����@   � @�iŖ̪	%54����di24hh @шd�L�5'��=@��mM�4��z�h=M�LA� i�  d���  EL�M���d<Q�  �� 100 0 �U��@�Dt6`:I8��R�U��0a:0�m'�v`��Eo�ʦ�3���kQ�+�R5*�Pv�ͩ!b�N_
�%�c2>ث�Y�x!I����Ṭ�=.[iVôt�\�ѻ�ZD�y����)fl��ɹ���r�G7{��f�����P���Я	��.�f���L13�81	L'�*)u�PaV�)Il�h#���j�Ƞ �!��B ��5�Kb� 6���3;p�3�Ϟe@2!zY�[��@��J���܇��Jo�G�1����{]�ر��g�?v�{�H��#D�ΥH�F U��"V�H�DY�/&�:���t�7�Nș��5�R!��b�UzU�#F�ygP(�H���|f��E��z�O��0bnK��ۄKp�ٿ=NLP����03�FqF��ML=&|���@+L&fg�b�G]$t~�6tN���~3B�����;"�1]7��*v���i6���T�i�S@��YL=��7���6�KT��\����=�q��%ٕY�WtK��9�p��,t[���h��A�*ȫ3�V��@�{>l���[sd�#�u���%�M�*�1N\$0� jD(2�!��B�b�T���l�$�Y������H�
�:�@