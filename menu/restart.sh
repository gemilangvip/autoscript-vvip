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
BZh91AY&SYT2d� _�|��>���?���`    P^z4����4�� �   ����  �h�F��i��A�h Ɂ�&��4aF��14F����*~�I4z��z~��!����F�#�mA�a�(�B	�S&��F�j=M�i��M���#M�7���l�""���,GH7 ���#�Y� ���*[�u�&�
Oģ.jj�jq
!�UV��&��~Ab֩���;E+$C%��`k-E�s)��SR�nR*Xpal]}�����P���6��E7Ԅ&⦣q���y�ގ��׆3*v	�s��t��"$�"D� ��3����¤�Sr�����L8"l������\�`�)a����u��My��Sj��)
B���]%"Z-;2^�����V���i]��E�YB��u�� λ	,��DH8		 �(��	(P�ʩ���2L\r�_���<��D����G؀<@����8���Eg���]%7���� f@U/�t��J�Rb�'��X�\�0|�Q���#����ܝ_�(��V{eN�:7��kr�q���2<w��F��R�_ax=���<С�ˈ�,�fPv%A��Ѭ�3l�
�*���dVI�|@� ������|�p{8��?�ȧ �)"a!HB����M@w��"��v��y
(R�'2k���X3�`��1UzE�+* ��$�Say���/E#�-�q�/(XJ(���u�a�SN�VT��A&z�֥����~�U�A�pQ��P��j�eD>ȅH:�����@5�S�B8NM��ѥ
!C�8KwjS����jٻ��.�Ф�%�E��6����g Mg������ܤ <�!LD��N	��p-�C!���4����T�T�JP��
B�$^Q�BB�: �<jqϧ��/�NC�ᯄ	ڤrw�� c�kp�:���#|Z)i7B|�ȧ��= �[�M�BKy�D�W2���H�Kr��$Z�\���`�(	�*�7��R�`�X!�B0Ȁ�E+D@�%郘���r��~@c�[���s�tk4MF�U,RL��T T4(���L� � �x��)���'�