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
BZh91AY&SYHd�  6_�|k�{~��.����  D  � P 0A�����OM �SI�i�����0O@�5�TԞ"dȞ��=L�LFL� JD����      ��U�P�c���.�a���\+�#kHn)�D.�3T���e�j����0�]."ݠ��؊���qE�<��Yf����$�&�E<�("��;3��z��g�����ph�9w`H3Ś�����|�~�� yȠ1ռK�1���i;�
+���J�"���V�dlV>I�q!.���a����@8Ab�2btP<�f��`��If��0r���!)���el`���lO��p%a`	�5-�#��;Ҕ���j��K 淤uD��ͮr�-L��°S����/` �@A?�.�p�",�.�p� ���