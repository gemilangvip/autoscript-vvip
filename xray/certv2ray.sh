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
BZh91AY&SY[e�9  |��@ ��_-������@�n4@h�2�4SƩ�~��i�Q�z�L�L����2i�@ � ��yM�i�di���@�2	$�OL�G���=56��=&S�4� �he=Ck�[e�W�O��WpD��0��q�_%i�YB��I4>r��Bh�RrOP�����Gr��`� �|\LuZ�:r/1�]C�2���H(�D���; L�� Es5�DR�x�QM��C��phLH�~����N��DUL���D�фg�����?�P�����f������+eɰ�C����𗥅�t��/oe�h�=��Z�d�t{?��c��\0�S]N�����<�g�vO�_
h'XD�0Ln P��$�S��.����~>�
�>��L�cCa��m�e��\QA��?�h�譡?1����uC�sB�܎��uygS����0��X�]C�ck��8[,�<)>�	f����.:��v��Sz�����J�Ʉ�7җ���US�.�2G52?%˰}%�s�ha��)��-iOLs��^`�+G��-?��	�G������r��S.��x�^�G��HdE��Z�m7 3��LJڃ#>�|NtJ�J��J,F.���P*a4�4E[Fc��'0���sJ!��5W�ܚ�Ê�kv����g���nk	+,�,e�x@v����WKE!��9y2!+-3����A��Qpe�喚�D��@�^ޅ{0��k��ܑN$�q@