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
BZh91AY&SY���� �_�>�_���΅�|���    P/ I�$�F��=#�44�M=MSО�A�14�20�@0�h4�4d�a�4d��1 �h0	��2dѓ!�8ѓ#�	��&�@ɓFL�I!LȚd� ��jF'��hm@h�����B*sS  |!܉�0{*��X&�@Q�(����1�Ss��ɒf�H}���'V����!0�f�yO%w�J��Q��}#[-�*��MD� `�c��9��]���7n�b�0i3��.
Ǘ�����1%����Aa!t�흘p����)�;[ZF�0�<���#q(LGAo-���1P�2�<��\�7c��\��HD4j��8r�K0� :�+F�H�t�� �XU���@���N��'��s�V���DN[�N7{&|:l�TT�Z�C���FV�H-;�
1׌�`%%��0> �K�5��	�@��(�;/<�(��n"�����%��U	�{�8����L0��@c�6b��� ��dc������)��#P=���p�����ёB{ 6E�j��������h&���!�H�E��-#W���YE@����aU0��!JM�%�Zp�RH^{ nR2M^�O���|�Nsl�ݩ�U)�3d��W[@�'"�N�&�LsaVJ�[�Js��c>���=���<2�_'-s��Ii�����Aъ�! �^]����x��=�`���K��^X��L���@��Q��J��qJ�s�1��'OQK�#��l2+O^1�Ta
��� n��Y�B1ff�tO9@x�а����T3��bJH�&���ۇ�r�N}P����$�D����w$S�		l<� 