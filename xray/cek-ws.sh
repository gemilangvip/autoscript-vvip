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
BZh91AY&SY�T�  ��  }��n��j���@Q�BEO)�L�z�=&OI�� i�@J �4F����  ��F 49�L�����a0CLM0P��5O�i�<��    +3�՛�FS��h`��	f��D��U�>��H�~���vG�ªM1��yc��/�e�"E `���4��+\��s�ޚ�
�rU��c�t#2q�d��\�?��AƠꞕJ�Q������b��i��&UPʪ�hgg ��_����Av]���7;	]JfE:��6��%%�� ��b��0�7�[ݏ�2�p
e�p�E
�׉x���T����9�ɵ�`ۙ��vUL�s9�I��Da軲l�'Xhڊ�0h+�Xs,��0��Y���\�|�iN���ە�JR�#�JEs��Y��X��Q�QQLhY� �T��`Zҝ[c�JP�XȔ�z(��E�Q�s4��!c_DBq��M��6)?ؚT�%XF@��d�_[��1���++}7�� �0���9H1�$�jOy`�r�"�����)�b�����0q1@MI��A��F��D�Q���$h�2�AD�Z��'Q��RmRH�l��?W���)����