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
BZh91AY&SY�J= �_�~�����������@D@  `y��۶o=ܺ����=��QRb�hL!�F �#@ � 2H�OQ�M=5   44   @ �eQ��4 �4    h�h4 SE5=*~SO"�����M4S@6��i���  �Ѡd� h 144�4�F� 	&DɠF&��4�aG�i�2d��  �h2W QL�Ζ^�WL�����r� ӹ/�S%�.�X�P��'ڢGMech'��M�$���	<�V*5�왅X���ߍ��B��w�[�z�0���q!�r�j�b��Ψ�2(�����
������rm�S��yB��䞏�i&�_E�N�
��Oځ܃78�6��͑�5�V�TY�P)�75���Y�IizF���:�!X���Ђw�э���`f|�6#�9�Ҡ��;�<÷��s�b�A�Y��U%��T"��ty�>s�fdC����f�[����w��͓y�ґ��m���B@�j�$k����I�#��P�xo����*I�� ^�][+������8��4�;�� �@���R�9��#�ȏ,�M����y�6D�W��2e0jnVg��m�j(	-P�&�q,E%��0�}Ϟ֞ Tw@�Ӄ��X�	�Q8@]���U�8ѣ�SM@`O�0ރ�uo][&R���P+3F�TJ6&s������ b�L����+�
B:#��+m z7�(�d��&��q�wI$�I$��rj�w�N�mj�E�lzYk��/>žs�s�(������ 4�o��>�cr�`a'�C�" ���!�$���ir���I�}�؏[��𘒈��9�0�${j����W�`��\���F�Q+WL�
5�$�dc�&J�[�ҫ6K?�s��c��$(�Ox5��1R:u�2���-G*7j"�Nc���!v]E���̛�36�#�i���R��vC�A����rK�+i/��@ :Z<�`GY�2�Q�!�2R���J=p[��?6C�
�P��E�k y���D����2n��C0"�s�\�ƦgN@�&�0�0�XC�ؗxϏ<��,��ޅT�Y���WJI���U�X�|¯��u�	�e�5d�%y��8O���/ eW�[cGd�.����e����mv�0���P��4k3zZ�P�$�-p`^�ĸ�b�p;>���!o0V^UA����"&SN2�yd��E�-��xBVO��Eu�3^W�d(-{MFЌ�wVqA��u����V+7'�=������ � e��`|z�/��IXAY��DVX��F3��1�h�ZA�Ibw&�t�Ї�zE�)�e�XѠ &�P�]����\6�anM��P$`�-�pL2�W�X��=�#�Ӻ(q�h ��$0]��.*
�Y�M ���ԹmxL��F5\��#h5�4�Ff<Aļ&�s3"~������Xh��F�BR+W����U��1�ɨ��eR�M2�Պ��&�� �j���. �oAD#�8)�iF�5б����c�d��i��a��^6���P�,�`A?��g/?��ˠ~`���BbHL�a�� !E�_�w$S�	��Ѱ