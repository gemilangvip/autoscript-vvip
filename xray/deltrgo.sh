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
BZh91AY&SY��V&  ��� 0 H}���?��/����@   � @��������OJmM���I�i=M��4z�F�4����ڠ%)��F�Ph     i� H��	�h6�h h�444�  �I�zb��G��2b �h=@�j 	``�����w��zk2Q^^�q`�N+0�c��Xb��O6B�5�^H$,��"�b�GfGa��ZȀPBr��a}�3"��-Y!BɚR�d�k^�p�x�NN^�7�O��@��!��i5!��ŕ�5>��se�E�%���e�Kn�3(�	��Z!Z`m4��-A�f��°�YJ}��%I[�0�u&��}�cג�Y)1��8҉6c��@��TDd�Z-�5[�t�7V����AG��`.{�u��~�Z�$���9r�	�	-^�K�y�<DKg�b	%�_�L�5hۨ�;�������4�]�Z��@sO�^ @���N�Fð*Ahs,��>{bs���R5E.�$�|�b����+��ph�.T%���=��t�T}�
eZ�'"���i��Bb�b �Z$�md��X��M��ʕZJ]�
����m�,^��|�¶��]�p`���y����*�(��*�4C)���L�o�.���&Cp�(9tB�L�i��M�s4r&�7(�9ܭ�Xwg�G�`"B����*:UM�Kkd��ڪV�����F��M�G��`[��	�x���(L��rL̛��c�]��BBX�