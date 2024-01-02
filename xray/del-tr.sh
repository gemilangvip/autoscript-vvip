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
BZh91AY&SY �1�  ���A� ��?��+����PD@  P7Yl�n8J�#&��` ɣA��4�h�dh �DM�0CJmOSOSe �h�@a dh=@8hd�CL�22����ѓ@21"��&�4  h �   4�@hTjyjh�(�4 @�A� �M >pO���{�f��r�\�Qrq��=�κ���)�R�Lɘ�������/]JN������N��h5�s��ֳ�Ą���0�~yY�rL8w��=�f�8�+�fW��5��x>@I��(�Kf�1*+�:���w�Pq_Na��S4��c�'�c���#+"�Z;�Ӯi�C�HA�� �9ɟs�2#a�A�$#�%$8I�A���(�d�ہ8����éY�����I㹒A���L�Zc�~�iX�U�q��׃WdV��s�|�~��=�z��Wdr-�� \L B�>�\�])��U��q���ąr8�"�B 0	�"��'��8X�
��A(���A�U�2t�բ8j��S�
�#���:��fo�h��E[����j�e��V�FڎlpT�[�$�����Ry%{����S�QX��;���L���T'�>~��CDT���ڠ�N�J���4�B��>�g�SCd-I'tt\D�4E�Eg��b�@X�Te��L
7ߨ~n9?IR�P��i�����`�{�n�3��)%�O%p�jS'���z�:bP���VM@�"|4�CuL؞�>q����a��pF�w��qc��Y���0
Y��+��(f��v�V9�Dn�8�U�`���P�PN��/h�S-ĪXaJ��(W��+(��0���IU�!��`'
�O TRz @��H�
�9�