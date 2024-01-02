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
BZh91AY&SY�a� �_�b�����\����� @g� � P>:��)��Ҟ������F�h�� � p�L�FL0	��bd4���E=	�  � 4  �  �4�=M��@�4 �  �h"P�	��P�1hFF��Cjz�#?)Lr�9�-u��c���9o�$�) �qa1���9�QS.��?2�0j��p\��֬���8���rĞ	��Q.s�%;��/$�I]��ں��e�&-!�����\�z��`��ѤiZ-aҼZһ)]�{6�qz<�I�fi���M`�$��\wZ�ҹUd.���+2�êv)���LD�bD��$�R-��d��X�J��3�a��ބ�3�*��Cwb�	P3��BX�a��"� h4�����������&&���5%X�c}�è͟u�6i7D�� ��iZ�!��U��-� ��ߴ�(�����T��}	����m�:vԳ]�[ZF㬐t&���1�r�T����2f��&��	@L.	��*HHbMf����w*���$�WL�Sl�n�$��J�F�R�@�:t�0NѺr�[�x`v�9S.�T�ސi���R���%�$��b��{���$򐲗��┧�R����VkdyJ�ln�P��L0���?US1A�TF��6�0��	)E�%)0�"R�A?tp0�|�P��E� �fJTL�
mB�L����Pj�:E#[Y�a'.$H�0!�*����H�����IG���)�|��