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
BZh91AY&SYk��  t_�B]���~��/o���@QqjM�$��OF��4m�4z�##M 4f��$� ԙ�0��z� &��6P��4��d�L����L� Ji�����<�@=OSA��� �F�m���ϵ�02wDxҎ�����Ni���j�gF���sؼdM���}4m�H"36�0<�����;��;0�K94�7�NkQ/�Eb���I���䞹3�zi�s�/��m�EZ�{ d�N<M�Nɯ�
1����&N6�yâ<&&E�u$��D�-�����\�%`�� C�I���90�+�Y���"0��>Ҕca��R}��y�L:=�(�߆�X�b��>�)��Fʻf�ui������]StD���m�[a>�kZ؜Y.@i�����R5ٜO�<>�*^�=���;�:7����r�QqM��f���=����ǹg�
�S��"�8&/Ra����$`��T}�k���S�*ʇ"�X�B?�b�6��R1��}�����VR"Sq	�֫e��D��&>gɟ������l��3n"�����Vy��H���?���J�vF�	�ĳ8xcJ�d�߿}"%�� ĉT���(�8I��,8Ȓf��H�
~>7@