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
BZh91AY&SY;
Ӭ ���~�����������@D@  `���[۹��1"���)�iOSOS�?Rz���4hPi�� h@  �biM�m�a14 2����& ѐ��
���    �PѠd  ��i�����ޑ��@ 4�FF�h   F��C��44�  &��� hѠ�A$D� ���14�i�6I�i���  h�4�
����c���u��!UQS�(M�\��B	��QB�9���3��:jFh�v>i��?�E�V*�\�`�N.�y�T�OV�>`�K ����8��Cj\һ�J �m������e,��6X@A׀x-F�'L�LLw�������K��o�YF�Jc���e�U��k6Ι��Z�����q��ia�D\`�"ᜥj�xE-�E#A �3�y�(�R��kE��pgn��o���qN����W�d{/��넀̤���BOSC�LKI�G�jԾ�qU�&�@�lUSm�o�¬�F��r\���LV2��#ll3�Hf��띆�4�{4&���#�r
�Rfc8;0��
�����۫}U�����L�G�|Y́O���I�$�mΈ.#�����.�EƑ����Ş��&�: )���je�UE�����r�x)��D�����8Tu���xAp�-���'u�V�{.*Wt�X����ٓ���P a��/��ڱ��r���(r�,(�aQG)9�T�b ��$ �(�)��9����@f���ߨ-vQ�'x\c:1d�m��m��V����W;q��8k����Y��ZCέ]c�W�8��]jD�:�>���!(��>d̒wt�W2���Uf��5qg߉om�+��r�\?㽬���m�]�6�B��]f~ø�[]�7S�ׅ1-*UVL�U�4��)D=\%%�N2r�,�NIzQLun�5���4%A/钁��&�͢_��eaed`\�3�Z:�CPL��2;�m8�6�CIvA�`�	D"��G�S��W��#cp�t1W�<����>����R@�?�����W����{��2��������Wd,B+����vŉL5��n��sęZ��Ɔ(�� �s�r[V��31����hx��K��2���6Q16�D8v�8$�s&0d��J�H��H+J�қ-�h'���_�F1����G!]��iQ	6Za�0̹� ���0�r��Ka��� �b�SJp`�b��h\I�R�o�A��͆�քWHEu)�7��j0 d4��ر�k�Eõ�n�mb����7�|��3�K��$���Q���!��ա��j�=��Jy��2��NFE��0$p0 r	e )u�B��%`��8)���L��3Ŗ��u`�@�[;��I� �9m��u�P�2�{mZ&)/SR��q��pY�t�]��A"ڑu�A�����Ʈ
��h�5��$��!�xд�0��J�TP���MS�����/�Z0��2������BFLa����TR�`:Ў������sFކJ6��G9AZE��WĦ�z�$" �,�PW���������d�j@DL��y��s|,[��1���Ķ��,�+��ٌk�R1�0)�9�8l!��|���e�K@IpBX0w��u���"��-��HLI	���ِ���]��B@�+N�