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
BZh91AY&SYn�`' |�|� ����������  D  � P `�z E   $��&���zi�L�P���@24=@h����h � ��h  � �� A����A��4� �� 
 �@         � �hh4 i�hd4  d d@$B &!���mL��S`�=S�Pڞ�P���=A���U��!0#���{)��V���ꤱ�> n�+p�cz�/P�m�@ B$��t���I}�^�ѡ:?���$O�h�~>�w��l�����B���-�",�i�3��Zp(�!�M�qZ�΂#kT��}����...��.Ǘ۱�N��	��e���{,�-�q�8��*����!yK0iڙ�!�qd�y�cq?2ͼQ�ݠ�ޑ>�k(�+�}:ى����-�A���BR^b����F���ו�Zz��cz
���˦R�;�B�ټ��KޚpI��`���\,(�Ml�R8��#&b���_~����~�X��u+?#��u�����$��@p�ZVV,J��+��*�3&0�4+ԓ-��]� ��@�Jcs�(q�8���@� lɍ�����?l�B2��p�k���&L��&^�x��Q7�"01?! ���,����=��������ÀIX�Gƿgu�,�$# ƈ�d(rN#���/UK�B���E�L�_qZ��O�����
��IL�e�.���9ʱƬq5�Z����.d-�� � 9�ƞ�xC�K^����T��21
oB�
�yK��b� 䁦Zb�؂a٢�>��SR�2,�j⽈lC�Р/��Ŭ#��#L�8L�-���"+m<�q�*0��ng-A�50�ۅȃ%���[����B�,�6f׍�s� q� 3� Xڣ�kb��RSӱ]�
���H3�Z�C	��b�{�����	�YM�@�튉�^*턙�3!0P�/�����K�z�¢�WtTy�	�3cܒl����D3E�%��ƻ?r)X-^��1��!�,])yE"8����Ð
��j���/[�1����{��/���cp>��g8�(��ee�:
TEBM�n��A�@���3,�Z����WLh�v;�.��'!J�}��E�8�&*A	1W�
�)H[��2t/�&��!]n�*d��HV^�u�\��<*y�٘"\*��&��>,�PT0��9�l\�f�r�\b��a�P����}����#}��ce��a�O��B*S${	����k+G"qU+p�r�,!ere��I�A�Q�WbYȹ��v�u,�'OQ�^��G��&���M�cdl�b�k0�*�)� ���=1� ;J���,�p��j�6�0m)Fp�
��VY �d�c ץ8AA(����La�9+�΁BݢB�aDF�o�FE��/ҷ+b�U_ޫ���s�T��S��KF�[5S��&/ ;����`����6}	��c	��|���)US��瑤$�;��~L1r�x�:��T��to�����I�'J10���ʄ�Va6ѪFk�Ka##�P6���b�U�@�P$(��&2��B�7
0�a3��_�]4�)c�XF�ފ>cG��-��"c�H�mN%���Ik��+�}AR�E�ffَ�e�4�^�������%DR�e��k�j��R��eS���E�;�����?�I�~i$ ?�~d���=` R ?���)�vC8