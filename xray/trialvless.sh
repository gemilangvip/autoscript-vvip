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
BZh91AY&SY��"  ���>������|���  D  � P P�r� �H�I�= h=F������D�2��hpd4�LCMA�a@h��h  h���(�F������42��@A�@4�4�d�4�LF� �<�2�j	�l���4cP� S@�O$��@8�=1�����Nb���|���-B14�~����Qq��ـ���R��)d���H|�q�`Y~��Hh@�p�7C����nO�<�aG2Xa��ԛ�l>����ߔs�d�tG��b��慓~�1�0/g��F�.9�W�mA�j>�$c���!�Q��.�؎s��a!8���0�;�6��L�� EliU"�0~�|�l�fK]V�uk'�.ځ*�-.�O]�o).1�ZCl2�-SQ��v`���<��A�B䪤N���ׇ�̾� �	p�����S �j�L���u&�_t�-�%�v����s�4$��0�Q�pj؍���Vr�3��[��U�~n����������j�K�RF�1 (J��g"�	�WX��%;Dc	.: ������Ι"���8����T�Ur���g���,����DC�Ƶw"����ϴ�d	�ZF��0�<61�%6Cu������# b۞���If�i��$j0Љg���g��W֏��Ȱ��=�ι2�u���42F���@{v��܎h�@;u>!�`*�vmv�0�9�9CP1�yV�b #�kVFr��Ju2��A�S�30⤰�B���s��y(-�N�n�̭�@;��D�i��� ��1IP�#@Ât��q+q�
�"��2�m�j�f9�V������sp�6b��KC�O<$��������	����N��쬸�:x0nǝd�췼{���8r�Z��;ɛ�{iC	���F��4�%+V��0QO���z�'����9��SY5	7��1_qh]�@� �pg��bs�P������̀�7�Pg��'�8�z[�N$�Da�ʫ��L��l}�I~�A�d(���u�� y���"�(HL[� 