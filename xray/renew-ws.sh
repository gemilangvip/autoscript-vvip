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
BZh91AY&SY���  �� 0���?��o����@   � P������4�8d�Bi�cM����4�4�2 hd�چ���L�)���i� �   �)�D�z�4mM � h�h �C&�dhi��ddhd&�� ɑ�a$�ɑ�)�M�ɦ���&��d�	�2d��!$+]Ǎ��^��DWTU��9�A��v�1q� ��5GV�Xf�=���(�b0��3��f;���X�%�,+M�k�jeĈ(�S4mFC�����D:���B��jH-��
�!8EGf��)�b�������o.Y3��9l{�M$RR[D���,H>�FMk�N�K��C�d'ǟg)P�q�B.E�<�A�#Hm�󈰔�w�B3\��"CZN5�^�H9��0�ޚ�3��E�6x�/�W:�O$`F�>����f��C�aO,	�����i�	LM� �/��wxB�5I�LFF��U�)zW���)A�z}�݆�N��QO[́X Pr�۾�䋍\��w!�j�Ѷ}Z)$ґԑi�7
�t��+.�l�1���5
��$ FE�+���Dˠ h��C��?9vF�@� �ټVdAy,��t�v�i����0�5�9��1���]�	�Ǿ�U�$%��+���_n1��ԘW�R���g֥�.Z���E�.�Z��� @�130�D5��¢�D�y���x�'E#! �
wVX]�/32cM8(�N<P~Hb��ȭXA*{�2�`���,���
���|g5ju�x;@� ,��������/[(kY�++̲�P1 K�0��$&��l�N��%�#�9��Fb�8'ykx~]P��N^FnS����_h�V��Xq2b���H��AI q�Wn����1�h�b�ބ��
�.�#�:}�B��5�¡�[�X K|$����ȣ�EoVUv��9K�:r���&/���e$/���w$S�		��