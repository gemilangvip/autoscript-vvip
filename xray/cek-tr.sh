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
BZh91AY&SY�9	�  v_����~��/���@[�( 54�LCC@4 �@ �@4�#��i�`��244B�S���Ѡ�424�  Ѡi�h$�2
i�L
=5H�f���i���4��Ѐ�A�S�
D�[BW�SA,�0��q�
��q}\�*��v�����"�	��r����Y��7^`��	Gt��MB��^�R(�އ�NN���=jh��h9��|�e���v�)�]q��ex���12���� L`����z8̘��B֊ =��31s;%0������x�˨ה8�f~�X� ��X�L(�a�T�"��ɣ��b��՗T��$2����C���$#F�_t�.�yl��������n[U��&���\Q_p3'���1Ǭ:��R���gG�]�H��uv#$��|�V�(�G�4Y�~�{tO-�����V����3�]��]J�ҟ�+&ʝxV���;��a'/m(����[t���^���R�f0:���������Ic>�sp��e�Gʴ`X���H�H�w�0�洋!�Si��)+�f鳗ЯJ��0��+�QM�&*�$R(�ċPs"J�
r�%�^V��1���H9�Z���H�
�!8`